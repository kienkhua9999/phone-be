const { authJwt } = require("../middleware");
const controller = require("../controllers/productImage.controller");



module.exports = function(app) {
    app.use(function(req, res, next) {
        res.header("Access-Control-Allow-Origin", "*");
        res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
        next();
    });
    //get
    app.get("/productImage/api/listImage/:id", controller.ListImage);
    // post
    // app.post("/productImage/api/addImage", controller.addImage);
    // app.get("/productImage/deleteproductImage/:id", controller.deleteProductImage);
};