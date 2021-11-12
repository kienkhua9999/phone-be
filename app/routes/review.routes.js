const { authJwt } = require("../middleware");
const controller = require("../controllers/review.controller");
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

module.exports = function(app) {
    app.use(function(req, res, next) {
        res.header("Access-Control-Allow-Origin", "*");
        res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
        next();
    });
    //get
    app.get("/review/listreview", controller.ListReview);

    // post
    app.post("/review/api/addreview", controller.addReview);

    app.get("/review/Deletereview/:id", controller.Deletereview);
    
};