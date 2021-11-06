const db = require("../models");
var pool_db = require("../config/crdb.config").pool_db;
const config = require("../config/auth.config");
const Category = db.category;
const Product = db.product;
const Producer = db.producer;



var pool_db = require("../config/crdb.config").pool_db;

// get
exports.ListProduct = (req, res) => {
    pool_db.connect(function (err, client, done) {
        if (err) {
            return console.error('error', err);
        }
        client.query(`SELECT products.*,categories."id" as cateid,categories."categoryName",categories."parentId",producers."id" as prodid,producers."producerName",producers."address" 
                    FROM products inner join categories on products."categoryid" = categories."id" inner join producers on products."producerid" = producers."id" ORDER BY id ASC`, function (err, result) {
            done();

            if (err) {
                res.end();
                return console.error('error running query', err);
            }
            // console.log(result.rows[8].categoryName);
            // res.json(result.rows);
            res.render("./listproduct.ejs", { list: result });
        });
    });
};
//post
exports.fromInsert = (req, res) => {
    pool_db.connect(function (err, client, done) {
        if (err) {
            return console.error('error', err);
        }
        client.query("SELECT * FROM categories ORDER BY id ASC", function (err, result) {
            done();

            if (err) {
                res.end();
                return console.error('error running query', err);
            }
            else {
                var categories = result;
                pool_db.connect(function (err, client, done) {
                    if (err) {
                        return console.error('error', err);
                    }
                    client.query("SELECT * FROM producers ORDER BY id ASC", function (err, result) {
                        done();

                        if (err) {
                            res.end();
                            return console.error('error running query', err);
                        }
                        // console.log(result.rows[0].id);
                        // res.json(result.rows);
                        res.render("./insertproduct.ejs", { producers: result, categories: categories });
                    });
                });
            }
        });
    });

};
exports.addProduct = (req, res) => {
    pool_db.connect(function (err, client, done) {
        if (err) {
            return console.error('error', err);
        }

        client.query("INSERT INTO products VALUES ('" + req.body.productid + "','" + req.body.productname + "','" + req.body.description + "','" + req.body.guarantee + "','" + req.body.makingdate + "','" + req.body.price + "','" + req.body.quantity + "','" + req.body.saleoff + "','" + req.file.originalname + "','" + req.body.status + "','" + req.body.categoryid + "','" + req.body.producerid + "')", function (err, result) {
            done();

            if (err) {
                res.end();
                return console.error('error running query', err);
            }
           
            res.redirect("../product/listproduct");

        });
    });
};

//pust
exports.fromUpdate = (req, res) => {
    pool_db.connect(function (err, client, done) {
        if (err) {
            return console.error('error', err);
        }
        var id = req.params.id;
        client.query(`SELECT * FROM products inner join categories on products."categoryid" = categories."id" inner join producers on products."producerid" = producers."id" WHERE products."id" = ${id}`, function (err, result) {
            done();

            if (err) {
                res.end();
                return console.error('error running query', err);
            } else {
                var products = result;
                pool_db.connect(function (err, client, done) {
                    if (err) {
                        return console.error('error', err);
                    }
                    client.query(`SELECT categories.* FROM categories where "id" != ${products.rows[0].categoryid}`, function (err, result) {
                        done();

                        if (err) {
                            res.end();
                            return console.error('error running query', err);
                        }
                        else {
                            var categories = result;
                            pool_db.connect(function (err, client, done) {
                                if (err) {
                                    return console.error('error', err);
                                }
                                client.query(`SELECT * FROM producers where "id" != ${products.rows[0].producerid} `, function (err, result) {
                                    done();

                                    if (err) {
                                        res.end();
                                        return console.error('error running query', err);
                                    }
                                    // console.log(products.rows[0].id);
                                    // res.json(result.rows);
                                    res.render("./updateproduct.ejs", { products: products.rows[0], producers: result, categories: categories });
                                });
                            });
                        }
                    });
                });
            }
        });
    });
};

exports.updateProduct = async (req, res) => {
    console.log(req.file);
    pool_db.connect(function (err, client, done) {
        if (err) {
            return console.error('error', err);
        } else {
            client.query(`UPDATE products SET "productname" = '${req.body.productname}' , "description" = '${req.body.description}' , "guarantee" = '${req.body.guarantee}', "makingdate" = '${req.body.makingdate}', "price" = '${req.body.price}', "quantity" = '${req.body.quantity}', "saleoff" = '${req.body.saleoff}', "imageurl" = '${req.file.originalname}', "status" = '${req.body.status}', "categoryid" = '${req.body.categoryid}', "producerid" = '${req.body.producerid}' WHERE "id" = ${req.params.id} `, function (err, result) {
                done();
              
                if (err) {
                    res.end();
                    return console.error('error running query updarte', err);
                } else {

                    res.redirect("../../product/listproduct");
                }


            });
        }

    });

};

//delete
exports.deleteProduct = async (req, res) => {

    await Product.destroy({
        where: {
            id: req.params.id
        }
    }
    )
    await res.redirect("../../product/listproduct");

};

//API
exports.ApiListProduct = (req, res) => {
    pool_db.connect(function (err, client, done) {
        if (err) {
            return console.error('error', err);
        }
        client.query(`SELECT products.*,categories."id" as cateid,categories."categoryName",producers."id" as prodid,producers."producerName",producers."address" 
                    FROM products inner join categories on products."categoryid" = categories."id" inner join producers on products."producerid" = producers."id" ORDER BY id ASC`, function (err, result) {
            done();

            if (err) {
                res.end();
                return console.error('error running query', err);
            }
            res.json(result.rows);  
            // var api_product = [];
            //         result.rows.forEach(e => {
            //             api_product.push(JSON.parse(e.st_asgeojson));
            //         });
            //         res.status(200).send(api_product);
        });
    });
};
exports.ApiDetailProduct = (req, res) => {
    pool_db.connect(function (err, client, done) {
        if (err) {
            return console.error('error', err);
        }
        var id = req.params.id;
        client.query(`SELECT products.*,categories."id" as cateid,categories."categoryName",producers."id" as prodid,producers."producerName",producers."address" 
                    FROM products inner join categories on products."categoryid" = categories."id" inner join producers on products."producerid" = producers."id" WHERE products."id" = ${id}`, function (err, result) {
            done();

            if (err) {
                res.end();
                return console.error('error running query', err);
            }
            res.json(result.rows[0]);  
            // var api_product = [];
            //         result.rows.forEach(e => {
            //             api_product.push(JSON.parse(e.st_asgeojson));
            //         });
            //         res.status(200).send(api_product);
        });
    });
};
exports.ApiCategoryProduct_IPHONE = (req, res) => {
    pool_db.connect(function (err, client, done) {
        if (err) {
            return console.error('error', err);
        }
        var id = req.params.id;
        client.query(`SELECT products.*,categories."id" as cateid,categories."categoryName",producers."id" as prodid,producers."producerName",producers."address" 
                    FROM products inner join categories on products."categoryid" = categories."id" inner join producers on products."producerid" = producers."id" WHERE categories."id"=1 or categories."parentId"=1` , function (err, result) {
            done();

            if (err) {
                res.end();
                return console.error('error running query', err);
            }
            res.json(result.rows);     
        });
    });
};
exports.ApiCategoryProduct_SAMSUNG = (req, res) => {
    pool_db.connect(function (err, client, done) {
        if (err) {
            return console.error('error', err);
        }
        var id = req.params.id;
        client.query(`SELECT products.*,categories."id" as cateid,categories."categoryName",producers."id" as prodid,producers."producerName",producers."address" 
                    FROM products inner join categories on products."categoryid" = categories."id" inner join producers on products."producerid" = producers."id" WHERE categories."id"=2 or categories."parentId"=2`, function (err, result) {
            done();

            if (err) {
                res.end();
                return console.error('error running query', err);
            }
            res.json(result.rows);    
        });
    });
};
exports.ApiCategoryProduct_OPPO = (req, res) => {
    pool_db.connect(function (err, client, done) {
        if (err) {
            return console.error('error', err);
        }
        var id = req.params.id;
        client.query(`SELECT products.*,categories."id" as cateid,categories."categoryName",producers."id" as prodid,producers."producerName",producers."address" 
                    FROM products inner join categories on products."categoryid" = categories."id" inner join producers on products."producerid" = producers."id" WHERE categories."id"=3 or categories."parentId"=3`, function (err, result) {
            done();

            if (err) {
                res.end();
                return console.error('error running query', err);
            }
            res.json(result.rows);  
        });
    });
};
exports.ApiCategoryProduct_REDMI = (req, res) => {
    pool_db.connect(function (err, client, done) {
        if (err) {
            return console.error('error', err);
        }
        var id = req.params.id;
        client.query(`SELECT products.*,categories."id" as cateid,categories."categoryName",producers."id" as prodid,producers."producerName",producers."address" 
                    FROM products inner join categories on products."categoryid" = categories."id" inner join producers on products."producerid" = producers."id" WHERE categories."id"=4 or categories."parentId"=4`, function (err, result) {
            done();

            if (err) {
                res.end();
                return console.error('error running query', err);
            }
            res.json(result.rows);  
        });
    });
};
exports.Apiproduct_lowprice = (req, res) => {
    pool_db.connect(function (err, client, done) {
        if (err) {
            return console.error('error', err);
        }
        var id = req.params.id;
        client.query(`SELECT products.*,categories."id" as cateid,categories."categoryName",producers."id" as prodid,producers."producerName",producers."address" 
                    FROM products inner join categories on products."categoryid" = categories."id" inner join producers on products."producerid" = producers."id" ORDER BY price ASC LIMIT 20`, function (err, result) {
            done();

            if (err) {
                res.end();
                return console.error('error running query', err);
            }
            res.json(result.rows);  
        });
    });
};
exports.Apiproduct_highprice = (req, res) => {
    pool_db.connect(function (err, client, done) {
        if (err) {
            return console.error('error', err);
        }
        var id = req.params.id;
        client.query(`SELECT products.*,categories."id" as cateid,categories."categoryName",producers."id" as prodid,producers."producerName",producers."address" 
                    FROM products inner join categories on products."categoryid" = categories."id" inner join producers on products."producerid" = producers."id" ORDER BY price DESC LIMIT 20`, function (err, result) {
            done();

            if (err) {
                res.end();
                return console.error('error running query', err);
            }
            res.json(result.rows);  
        });
    });
};