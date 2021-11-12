const db = require("../models");
const config = require("../config/auth.config");
var pool_db = require("../config/crdb.config").pool_db;
const Review = db.review;
const User = db.user;
const Product = db.product;

const Op = db.Sequelize.Op;


exports.ListReview = (req, res) => {
    pool_db.connect(function (err, client, done) {
        if (err) {
            return console.error('error', err);
        }
        client.query(`SELECT reviews.*,users."id" as userid,users."username",users."email",users."address",users."phonenumber",products."id" as proid,products."productname",products."imageurl"
                     FROM reviews inner join users on reviews."userId" = users."id" inner join products on reviews."productId" = products."id" ORDER BY id ASC`, function (err, result) {
            done();

            if (err) {
                res.end();
                return console.error('error running query', err);
            }
            res.render("./listreview.ejs", { reviews: result });
        });
    });

};

exports.addReview = (req, res) => {
    pool_db.connect(function (err, client, done) {
        if (err) {
            return console.error('error', err);
        }
        client.query(`SELECT id FROM reviews ORDER BY id DESC limit 1`, function (err, result) {
            done();

            if (err) {
                res.end();
                return console.error('error running query', err);
            }
            else {
                var review = result.rows[0].id;
                pool_db.connect(function (err, client, done) {
                    if (err) {
                        return console.error('error', err);
                    }
                    client.query("INSERT INTO reviews VALUES ('" + (review+1) + "','" + req.body.reviewDate + "','" + req.body.reviewContent + "','" + req.body.numberStar + "','" + req.body.reviewImg + "','" + req.body.userId + "','" + req.body.productId + "')", function (err, result) {
                        done();

                        if (err) {
                            res.end();
                            return console.error('error running query', err);
                        }
                        res.status(200).send("success");


                    });
                });
            }

        });
    });
};


exports.Deletereview = (req, res) => {
    pool_db.connect(function (err, client, done) {
        if (err) {
            return console.error('error', err);
        }
        var id = req.params.id;
        client.query(`delete from reviews where reviews."id"=${id} `, function (err, result) {
            done();
            if (err) {
                res.end();
                return console.error('error running query', err);
            }
                res.redirect("../../review/listreview");

        });
    });
};


