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
        client.query("INSERT INTO reviews VALUES ('" + req.body.id + "','" + req.body.reviewdate + "','" + req.body.reviewcontent + "','" + req.body.numberstar + "','" + req.file.originalname + "','" + req.body.userid + "','" + req.body.productid + "')", function (err, result) {
            done();

            if (err) {
                res.end();
                return console.error('error running query', err);
            }
            res.stats(200).render("success");


        });
    });
};


