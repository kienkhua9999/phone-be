const db = require("../models");
const config = require("../config/auth.config");
var pool_db = require("../config/crdb.config").pool_db;
const Orderproduct = db.orderproduct;
const Product = db.product;
const OrderDetail = db.OrderDetail;

const Op = db.Sequelize.Op;


exports.ListOrder = (req, res) => {
    pool_db.connect(function (err, client, done) {
        if (err) {
            return console.error('error', err);
        }
        client.query(`SELECT orderproducts.*,users."id" as userid,users."username",users."address",users."phonenumber"
                     FROM orderproducts inner join users on orderproducts."userId" = users."id" ORDER BY id ASC`, function (err, result) {
            done();

            if (err) {
                res.end();
                return console.error('error running query', err);
            }
            // console.log(result.rows[8].categoryName);
            // res.json(result.rows);
            res.render("./listorder.ejs", { orders: result });
        });
    });
};


exports.ListOrderdetail = (req, res) => {
    pool_db.connect(function (err, client, done) {
        if (err) {
            return console.error('error', err);
        }
        var id = req.params.id;
        client.query(`SELECT orderdetails.*, orderproducts."id" as orderid,orderproducts."orderate",orderproducts."totalPrice",orderproducts."status",products."id" as proid,products."productname",products."imageurl"
                     FROM orderdetails inner join orderproducts on orderdetails."orderId" = orderproducts."id" inner join products on orderdetails."productId" = products."id" where orderproducts."id" = ${id}`, function (err, result) {
            done();

            if (err) {
                res.end();
                return console.error('error running query', err);
            }
            else {
                var ds_orders = result;
                pool_db.connect(function (err, client, done) {
                    if (err) {
                        return console.error('error', err);
                    }
                    client.query(`SELECT orderproducts.*,users."id" as userid,users."username",users."address",users."phonenumber"
                                FROM orderproducts inner join users on orderproducts."userId" = users."id" where orderproducts."id" = ${id}`, function (err, result) {
                        done();

                        if (err) {
                            res.end();
                            return console.error('error running query', err);
                        }
                        res.render("./listorderdetail.ejs", { ds_orders: ds_orders.rows[0], orders: result.rows[0] });
                    });
                });
            }
        });
    });
};

exports.updateOrder = async (req, res) => {
    pool_db.connect(function (err, client, done) {
        if (err) {
            return console.error('error', err);
        }else{
          
            client.query(`UPDATE orderproducts SET "status" = '${req.body.status}' WHERE "id" = ${req.params.id} `, function (err, result) {
                done();

                if (err) {
                    res.end();
                    return console.error('error running query updarte', err);
                }else{
                    
                    res.redirect("../listorder");
                }
                

            });
        }

    });

};