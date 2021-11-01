const { authJwt } = require("../middleware");
const controller = require("../controllers/contact.controller");
const bodyParser = require("body-parser");
var urlencodedParser = bodyParser.urlencoded({ extended: false })


module.exports = function(app) {
    app.use(function(req, res, next) {
        res.header("Access-Control-Allow-Origin", "*");
        res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
        next();
    });
    //get
    app.get("/contact/listcontact", controller.ListContact);
    // post   
    app.post("/contact/api/addcontact", controller.addContact);
    
};