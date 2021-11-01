const { authJwt } = require("../middleware");
const controller = require("../controllers/producer.controller");
const bodyParser = require("body-parser");
var urlencodedParser = bodyParser.urlencoded({ extended: false })


module.exports = function(app) {
    app.use(function(req, res, next) {
        res.header("Access-Control-Allow-Origin", "*");
        res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
        next();
    });
    //get
    app.get("/producer/listproducer", controller.producer);
    // post
    app.get("/producer/addproducer", controller.fromInsert);
    app.post("/producer/addproducer", controller.addProducer);
    //put
    app.get("/producer/updateproducer/:id", controller.fromUpdate);
    app.post("/producer/updateproducer/:id", controller.updateProducer);
    //delete
    app.get("/producer/deleteproducer/:id", controller.deleteProducer);

};