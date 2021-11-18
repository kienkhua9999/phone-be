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

    app.post("/order/addorder", controller.addOrder);

    app.post("/order/detailorder/:id", controller.updateOrder);

    app.get("/order/deleteorder/:id", controller.Deleteorder);

    //api
    app.post("/order/api/addCart", controller.addCart);

    app.get("/order/api/Orderdetail_user/:id", controller.Orderdetail_user);

    app.post("/order/api/updateorder_Quantity/:id", controller.updateorder_Quantity);

    app.post("/order/api/updateorder_Status/:id", controller.updateorder_Status);

    app.post("/order/api/Api_paypal/:id", controller.Api_paypal);
    app.get("/order/api/thanhcong", controller.Api_success);
    app.get("/order/api/thatbai", controller.Api_Cancelled);
    app.get("/order/Deleteorderapi/:id", controller.Deleteorderapi);

};