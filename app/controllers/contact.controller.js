const db = require("../models");
const config = require("../config/auth.config");
var pool_db = require("../config/crdb.config").pool_db;
const Contact = db.contact;
const User = db.user;

const Op = db.Sequelize.Op;


exports.ListContact = (req, res) => {
    pool_db.connect(function (err, client, done) {
        if (err) {
            return console.error('error', err);
        }
        client.query(`SELECT contacts.*,users."id" as userid,users."username",users."email",users."address",users."phonenumber" 
                     FROM contacts inner join users on contacts."userId" = users."id" ORDER BY id ASC`, function (err, result) {
            done();

            if (err) {
                res.end();
                return console.error('error running query', err);
            }
            // console.log(result.rows[0]);
            // res.json(result.rows);
            res.render("./listcontact.ejs", { contacts: result });
        });
    });
    
};

exports.addContact = (req, res) => {
    pool_db.connect(function (err, client, done) {
        if (err) {
            return console.error('error', err);
        }
        client.query(`SELECT id FROM contacts order by "id" DESC limit 1`, function (err, result) {
            done();

            if (err) {
                res.end();
                return console.error('error running query', err);
            }else{
                var contacts = result.rows[0].id;
                pool_db.connect(function (err, client, done) {
                    if (err) {
                        return console.error('error', err);
                    }
                    client.query("INSERT INTO contacts VALUES ('" + (contacts+1) + "','" +  req.body.contactdate + "','" + req.body.content + "','" + req.body.userId + "')", function (err, result) {
                        done();
                
                        if (err) {
                            res.end();
                            return console.error('error running query', err);
                        }
                        res.status(200).send({ message: "Success!" });
                
                    });
                });
            }
            
        });
    });
    
};

exports.Deletecontact = (req, res) => {
    pool_db.connect(function (err, client, done) {
        if (err) {
            return console.error('error', err);
        }
        var id = req.params.id;
        client.query(`delete from contacts where contacts."id"=${id} `, function (err, result) {
            done();
            if (err) {
                res.end();
                return console.error('error running query', err);
            }
                res.redirect("../../contact/listcontact");

        });
    });
};
