const db = require("../models");
var pool_db = require("../config/crdb.config").pool_db;
const config = require("../config/auth.config");
const ProductImage = db.productImage;
const Product = db.product;

exports.ListImage = (req, res) => {
    pool_db.connect(function (err, client, done) {
        if (err) {
            return console.error('error', err);
        }
        var id = req.params.id;
        client.query(`SELECT productimages.*,products."id" as proid FROM productimages inner join products on productimages."productId" = products."id" where productimages."productId" = ${id} `, function (err, result) {
            done();

            if (err) {
                res.end();
                return console.error('error running query', err);
            }
            res.json(result.rows);
        });
    });

};
// exports.deleteProductImage = async (req, res) => {

//     await ProductImage.destroy({
//         where: {
//             id: req.params.id
//         }
//     }
//     )
   

// };

// exports.addImage = (req, res) => {
//     pool_db.connect(function (err, client, done) {
//         if (err) {
//             return console.error('error', err);
//         }
//         client.query("INSERT INTO productImages VALUES ('" + req.body.id + "','" + req.body.ImageUrl + "','" + req.body.productId +"')", function (err, result) {
//             done();

//             if (err) {
//                 res.end();
//                 return console.error('error running query', err);
//             }
//             res.stats(200).render("success");


//         });
//     });
// };


// exports.addImage = async (req, res) => {
//     // Save User to Database
//     await ProductImage.create({
       
//         id: req.body.id,
//         ImageUrl: req.body.ImageUrl,
//         productId: req.body.productId,
//     }).then(ProductImage => {
//         res.stats(200).render("success");
//     });
// };

