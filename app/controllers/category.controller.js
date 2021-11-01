const db = require("../models");
const Category = db.category;
const Op = db.Sequelize.Op;
var pool_db = require("../config/crdb.config").pool_db;
const config = require("../config/auth.config");


// get
// exports.ListCategory = (req, res) => {
//     pool_db.connect(function (err, client, done) {
//         if (err) {
//             return console.error('error', err);
//         }
//         client.query("SELECT * FROM categories ORDER BY id ASC", function (err, result) {
//             done();

//             if (err) {
//                 res.end();
//                 return console.error('error running query', err);
//             }
//             // console.log(result.rows[0].id);
          
//             // res.json(result.rows);
//             res.render("./listcategory.ejs", { categories: result });
//         });
//     });
// };
// exports.category = (req, res) => {
//     Category.findAll().then(categories => {
//         res.render('./listcategory.ejs', { ds_categories: categories });
//     });
// };
exports.category = (req, res) => {
    Category.findAll({
        where: {
            categoryLevel: 1
        },
        where: {
            parentId: 0
        },
    }).then(category_parent => {
        Category.findAll({
            where: {
                categoryLevel: 2
            },
        }).then(categories => {
            res.render('./listcategory.ejs', { ds_category_parent: category_parent, ds_category: categories });
            
        });
    });
};
// post
exports.fromInsert = (req, res) => {
    Category.findAll({
        where: {
            categoryLevel: 1
        },
        where: {
            parentId: 0
        },
    }).then(category_parent => {
        Category.findAll({
            where: {
                categoryLevel: 2
            },
        }).then(categories => {
            res.render("./insertcategory.ejs", { ds_category_parent: category_parent, ds_category: categories });
        });
    });
    
};
// exports.addCategory = (req, res) => {
//     var categoryLevel;
//     if (req.body.parentId == "0") {
//         categoryLevel = 1;
//     } else {
//         categoryLevel = 2;
//     }
       

//     Category.create({
//             categoryName: req.body.categoryName,
//             parentId: req.body.parentId,
//             categoryLevel: categoryLevel
//         })
//         .then(() => {
//             res.redirect("../category/listcategory");
//         })
        
// };
exports.addCategory = (req, res) => {
    pool_db.connect(function (err, client, done) {
        if (err) {
            return console.error('error', err);
        }
        var categoryLevel;
        if (req.body.parentId == "0") {
            categoryLevel = 1;
        } else {
            categoryLevel = 2;
        }
        var id =  req.body.txtid;
        var parentId = req.body.parentId;
        var categoryName = req.body.categoryName;
        categoryLevel =categoryLevel;
        client.query("INSERT INTO categories VALUES ('" + id + "','" + parentId + "','" + categoryName + "','" + categoryLevel + "')", function (err, result) {
            done();

            if (err) {
                res.end();
                return console.error('error running query', err);
            }
            // console.log(result.rows[0].id);
            res.redirect("../category/listcategory");

        });
    });
};
//put
exports.fromUpdate = (req, res) => {
    pool_db.connect(function (err, client, done) {
        if (err) {
            return console.error('error', err);
        }
        var id = req.params.id;
        client.query("SELECT * FROM categories WHERE id='" + id + "'", function (err, result) {
            done();

            if (err) {
                res.end();
                return console.error('error running query', err);
            }
            // console.log(result.rows[0]);
            res.render("./updatecategory.ejs", { category: result.rows[0] });
        });
    });
};

exports.updateCategory = async (req, res) => {
    pool_db.connect(function (err, client, done) {
        if (err) {
            return console.error('error', err);
        }else{
          
            client.query(`UPDATE categories SET "categoryName" = '${req.body.categoryName}' WHERE "id" = ${req.params.id} `, function (err, result) {
                done();

                if (err) {
                    res.end();
                    return console.error('error running query updarte', err);
                }else{
                    
                    res.redirect("../../category/listcategory");
                }
            });
        }

    });

};
//delete
exports.deleteCategory = async (req, res) => {

    await Category.destroy({
        where: {
            id: req.params.id
        }
    }
    )
    await res.redirect("../../category/listcategory");



};

//API
exports.All_api_category = (req, res) => {
    Category.findAll({
       
    }).then(category_parent => {
       
            res.json(category_parent );
            
        
    });
};