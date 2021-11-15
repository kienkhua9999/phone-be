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
        client.query(`SELECT orderdetails.*, orderproducts."id" as orderid,orderproducts."orderate",orderproducts."totalPrice",orderproducts."status",products."id" as proid,products."productname",products."imageurl",products."price"
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

exports.addOrder = (req, res) => {
    pool_db.connect(function (err, client, done) {
        if (err) {
            return console.error('error', err);
        }
        client.query(`select "id" from orderproducts order by "id" DESC limit 1`, function (err, result) {
            done();
            if (err) {
                res.end();
                return console.error('error running query', err);
            }
            else {
                var order = result.rows[0].id;
                pool_db.connect(function (err, client, done) {
                    if (err) {
                        return console.error('error', err);
                    }
                    client.query("INSERT INTO orderproducts VALUES ('" + (result.rows[0].id + 1) + "','" + req.body.orderate + "','" + req.body.totalPrice + "','" + req.body.status + "','" + req.body.userId + "')", function (err, result) {
                        done();
                        if (err) {
                            res.end();
                            return console.error('error running query', err);
                        }

                        else {

                            pool_db.connect(function (err, client, done) {
                                if (err) {
                                    return console.error('error', err);
                                }
                                client.query(`select "id" from orderdetails order by "id" DESC limit 1`, function (err, result) {
                                    done();
                                    if (err) {
                                        res.end();
                                        return console.error('error running query', err);
                                    }
                                    else {
                                        var orderdetails = result.rows[0].id;
                                        pool_db.connect(function (err, client, done) {
                                            if (err) {
                                                return console.error('error', err);
                                            }

                                            client.query("INSERT INTO orderdetails VALUES ('" + (orderdetails + 1) + "','" + req.body.Quantity + "','" + (order + 1) + "','" + req.body.productid + "')", function (err, result) {
                                                done();

                                                if (err) {
                                                    res.end();
                                                    return console.error('error running query', err);
                                                }

                                                res.redirect("../order/listorder");

                                            });
                                        });
                                    }

                                });
                            });
                        }

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
        } else {

            client.query(`UPDATE orderproducts SET "status" = '${req.body.status}' WHERE "id" = ${req.params.id} `, function (err, result) {
                done();

                if (err) {
                    res.end();
                    return console.error('error running query updarte', err);
                } else {

                    res.redirect("../listorder");
                }


            });
        }

    });

};

exports.Deleteorder = (req, res) => {
    pool_db.connect(function (err, client, done) {
        if (err) {
            return console.error('error', err);
        }
        var id = req.params.id;
        client.query(`delete from orderproducts where orderproducts."id"=${id} `, function (err, result) {
            done();
            if (err) {
                res.end();
                return console.error('error running query', err);
            }
            else {

                pool_db.connect(function (err, client, done) {
                    if (err) {
                        return console.error('error', err);
                    }
                    client.query(`delete from orderdetails where orderdetails."id"=${id}`, function (err, result) {
                        done();
                        if (err) {
                            res.end();
                            return console.error('error running query', err);
                        }
                        res.redirect("../../order/listorder");

                    });
                });
            }


        });
    });
};


exports.addCart = (req, res) => {
    pool_db.connect(function (err, client, done) {
        if (err) {
            return console.error('error', err);
        }
        client.query(`select "id" from orderproducts order by "id" DESC limit 1`, function (err, result) {
            done();
            if (err) {
                res.end();
                return console.error('error running query', err);
            }
            else {
                var order = result.rows[0].id;
                pool_db.connect(function (err, client, done) {
                    if (err) {
                        return console.error('error', err);
                    }
                    client.query("INSERT INTO orderproducts VALUES ('" + (result.rows[0].id + 1) + "','" + req.body.orderate + "','" + req.body.totalPrice + "','" + req.body.status + "','" + req.body.userId + "')", function (err, result) {
                        done();
                        if (err) {
                            res.end();
                            return console.error('error running query', err);
                        }

                        else {

                            pool_db.connect(function (err, client, done) {
                                if (err) {
                                    return console.error('error', err);
                                }
                                client.query(`select "id" from orderdetails order by "id" DESC limit 1`, function (err, result) {
                                    done();
                                    if (err) {
                                        res.end();
                                        return console.error('error running query', err);
                                    }
                                    else {
                                        var orderdetails = result.rows[0].id;
                                        pool_db.connect(function (err, client, done) {
                                            if (err) {
                                                return console.error('error', err);
                                            }

                                            client.query("INSERT INTO orderdetails VALUES ('" + (orderdetails + 1) + "','" + req.body.Quantity + "','" + (order + 1) + "','" + req.body.productId + "')", function (err, result) {
                                                done();

                                                if (err) {
                                                    res.end();
                                                    return console.error('error running query', err);
                                                }

                                                res.send("Đã thêm vào giỏ hàng !")
                                            });
                                        });
                                    }

                                });
                            });
                        }

                    });
                });
            }


        });
    });
};

exports.Orderdetail_user = (req, res) => {
    pool_db.connect(function (err, client, done) {
        if (err) {
            return console.error('error', err);
        }
        var userid = req.params.id;
        client.query(`select orderdetails.*, orderproducts."id" as orderid, orderproducts."orderate",orderproducts."totalPrice",orderproducts."status",products."id" as proid,products."productname",products."imageurl",products."price"
         from orderdetails inner join products on orderdetails."productId" = products."id" inner join orderproducts on orderdetails."orderId"= orderproducts."id" where orderproducts."userId" = ${userid}`, function (err, result) {
            done();

            if (err) {
                res.end();
                return console.error('error running query', err);
            }
            res.json(result.rows)
            
        });
    });
};

exports.updateorder_Status = async (req, res) => {
    pool_db.connect(function (err, client, done) {
        if (err) {
            return console.error('error', err);
        } else {

            client.query(`UPDATE orderproducts SET "status" = '${req.body.status}' WHERE "id" = ${req.params.id} `, function (err, result) {
                done();

                if (err) {
                    res.end();
                    return console.error('error running query updarte', err);
                } else {

                    res.send("Cập nhật thành công");
                }


            });
        }

    });

};

exports.updateorder_Quantity = async (req, res) => {
    pool_db.connect(function (err, client, done) {
        if (err) {
            return console.error('error', err);
        } else {

            client.query(`UPDATE orderdetails SET "Quantity" = '${req.body.Quantity}' WHERE "id" = ${req.params.id} `, function (err, result) {
                done();

                if (err) {
                    res.end();
                    return console.error('error running query updarte', err);
                } else {

                    res.send("Cập nhật thành công");
                }


            });
        }

    });

};