const { authJwt } = require("../middleware");
const controller = require("../controllers/banner.controller");
const bodyParser = require("body-parser");


module.exports = function(app) {
    app.use(function(req, res, next) {
        res.header("Access-Control-Allow-Origin", "*");
        res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
        next();
    });
    //get
    app.get("/api/banner/listbanner", controller.Listbanner);
    // post
    
    app.post("/api/banner/addbanner", controller.addbanner);

    //delete
    app.get("/api/banner/deletecategory/:id", controller.Deletebanners);

  

};