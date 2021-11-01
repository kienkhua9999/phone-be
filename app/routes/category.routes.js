const { authJwt } = require("../middleware");
const controller = require("../controllers/category.controller");
const bodyParser = require("body-parser");
var urlencodedParser = bodyParser.urlencoded({ extended: false })


module.exports = function(app) {
    app.use(function(req, res, next) {
        res.header("Access-Control-Allow-Origin", "*");
        res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
        next();
    });
    //get
    app.get("/category/listcategory", controller.category);
    // post
    app.get("/category/addcategory", controller.fromInsert);
    app.post("/category/addcategory", controller.addCategory);
    //put
    app.get("/category/updatecategory/:id", controller.fromUpdate);
    app.post("/category/updatecategory/:id",urlencodedParser, controller.updateCategory);
    //delete
    app.get("/category/deletecategory/:id", controller.deleteCategory);

    //api
    app.get("/category/api/Allcategory", controller.All_api_category);

};