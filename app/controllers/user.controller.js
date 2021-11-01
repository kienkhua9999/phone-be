const db = require("../models");
const config = require("../config/auth.config");
var pool_db = require("../config/crdb.config").pool_db;
const User = db.user;
const Role = db.role;
const User_roles = db.User_roles;

const Op = db.Sequelize.Op;

var jwt = require("jsonwebtoken");
var bcrypt = require("bcryptjs");

exports.allAccess = (req, res) => {
    res.status(200).send("Public Content.");
};

exports.userBoard = (req, res) => {
    res.status(200).send("User Content.");
};

exports.adminBoard = (req, res) => {
    res.status(200).send("Admin Content.");
};

exports.moderatorBoard = (req, res) => {
    res.status(200).send("Moderator Content.");
};
//get
exports.listUser = (req, res) => {
    User.findAll().then(user => {
        res.render('./listuser.ejs', { ds_user: user });
    });
}

//post
exports.fromInsert = (req, res) => {
    pool_db.connect(function (err, client, done) {
        if (err) {
            return console.error('error', err);
        }
        client.query("SELECT * FROM roles ORDER BY id ASC", function (err, result) {
            done();

            if (err) {
                res.end();
                return console.error('error running query', err);
            }
            res.render("./inseruser.ejs",{roles:result});
        });
    });

   
};
exports.addUser = async (req, res) => {
    // Save User to Database
    await User.create({
       
        username: req.body.username,
        email: req.body.email,
        phonenumber: req.body.phonenumber,
        address: req.body.address,
        password: bcrypt.hashSync(req.body.password, 8)
    }).then(user => {
        pool_db.connect(function (err, client, done) {
            if (err) {
                return console.log("error:" + err);
            } else {
                client.query(`Insert into user_roles("roleId", "userId") values(${req.body.roleId}, ${user.dataValues.id})`, function (err, result, row) {
                    done();
                    if (err) {
                        res.end();
                        return console.error('error running query add distric', err);
                    } else {
                        res.redirect("../user/listuser");
                    }
                });
            }
        })
    });
};
//put
//pust
exports.fromUpdate = (req, res) => {
    pool_db.connect(function (err, client, done) {
        if (err) {
            return console.error('error', err);
        }
        var id = req.params.id;
        client.query(`select users.*, roles."name", roles."id" as rolesId, user_roles.* from user_roles inner join users on user_roles."userId" = users."id" inner join roles on user_roles."roleId" = roles."id" WHERE users."id" = ${id}`, function (err, result) {
            done();

            if (err) {
                res.end();
                return console.error('error running query', err);
            } else {
                var users = result;
                pool_db.connect(function (err, client, done) {
                    if (err) {
                        return console.error('error', err);
                    }
                    client.query(`SELECT roles.* FROM roles where "id" != ${users.rows[0].roleId}`, function (err, result) {
                        done();

                        if (err) {
                            res.end();
                            return console.error('error running query', err);
                        }
                        res.render("./updateuser.ejs", { users: users.rows[0], roles: result });
                    });
                });
            }
        });
    });
};

exports.updateUser = async (req, res) => {
    console.log(req.file);
    pool_db.connect(function (err, client, done) {
        if (err) {
            return console.error('error', err);
        } else {
            client.query(`UPDATE users SET "id" = '${req.body.id}',"username" = '${req.body.username}',"password" = '${req.body.password}',"email" = '${req.body.email}',"phonenumber" = '${req.body.phonenumber}',"address" = '${req.body.address}' WHERE "id" = ${req.params.id} `, function (err, result) {
                done();
              
                if (err) {
                    res.end();
                    return console.error('error running query updarte', err);
                } else {
                    pool_db.connect(function (err, client, done) {
                        if (err) {
                            return console.error('error', err);
                        } else {
                            client.query(`UPDATE user_roles SET "roleId" = '${req.body.roleId}' WHERE "userId" = ${req.params.id} `, function (err, result) {
                                done();
                              
                                if (err) {
                                    res.end();
                                    return console.error('error running query updarte', err);
                                } else {
                
                                    res.redirect("../../user/listuser");
                                }
                            });
                        }
                    });
                   
                }
            });
        }
    });
};

//delete
exports.deleteUser = async (req, res) => {
    await User.destroy({
        where: {
            id: req.params.id
        }
    }
    )
    await res.redirect("../../user/listuser");

};

//login
exports.signin = (req, res) => {
    User.findOne({
      where: {
        username: req.body.username
      }
    })
      .then(user => {
        if (!user) {
          return res.status(404).send({ message: "User Not found." });
        }
  
        var passwordIsValid = bcrypt.compareSync(
          req.body.password,
          user.password
        );
  
        if (!passwordIsValid) {
          return res.status(401).send({
            accessToken: null,
            message: "Invalid Password!"
          });
        }
  
        var token = jwt.sign({ id: user.id }, config.secret, {
          expiresIn: 86400 // 24 hours
        });
  
        var authorities = [];
        user.getRoles().then(roles => {
          for (let i = 0; i < roles.length; i++) {
            authorities.push("ROLE_" + roles[i].name.toUpperCase());
          }
          res.redirect("../../index");
        });
      })
      .catch(err => {
        res.status(500).send({ message: err.message });
      });
  };