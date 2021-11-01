const { authJwt } = require("../middleware");
const controller = require("../controllers/order.controller");
const multer = require('multer')
const bodyParser = require("body-parser");
var urlencodedParser = bodyParser.urlencoded({ extended: false })
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, './app/public/uploads')
    },
    filename: function (req, file, cb) {
        cb(null, file.originalname)
    }
});

const upload = multer({ storage: storage });


module.exports = function (app) {
    app.use(function (req, res, next) {
        res.header("Access-Control-Allow-Origin", "*");
        res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
        next();
    });
    //get
    app.get("/order/listorder", controller.ListOrder);

    app.get("/order/detailorder/:id", controller.ListOrderdetail);
    app.post("/order/detailorder/:id", controller.updateOrder);
  

};