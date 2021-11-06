const { authJwt } = require("../middleware");
const controller = require("../controllers/product.controller");
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
    app.get("/product/listproduct", controller.ListProduct);
    // post
    app.get("/product/addproduct", controller.fromInsert);
    app.post('/product/addproduct', upload.single("image"), controller.addProduct);
    //put
    app.get("/product/updateproduct/:id", controller.fromUpdate);
    app.post("/product/updateproduct/:id", upload.single("image"), controller.updateProduct);
    //delete
    app.get("/product/deleteproduct/:id", controller.deleteProduct);

    //API
    //api all product
    app.get("/product/api/Allprodroduct", controller.ApiListProduct);
    //api detail product
    app.get("/product/api/Detailproduct/:id", controller.ApiDetailProduct);
    //api detail cartegory
    app.get("/product/api/Allcategory_Iphone", controller.ApiCategoryProduct_IPHONE);
    app.get("/product/api/Allcategory_Samsung", controller.ApiCategoryProduct_SAMSUNG);
    app.get("/product/api/Allcategory_Oppo", controller.ApiCategoryProduct_OPPO);
    app.get("/product/api/Allcategory_Redme", controller.ApiCategoryProduct_REDMI);
    app.get("/product/api/Apiproduct_lowprice", controller.Apiproduct_lowprice);
    app.get("/product/api/Apiproduct_highprice", controller.Apiproduct_highprice);
    app.get("/product/api/ApiProduct_IPHONE_Popular", controller.ApiProduct_IPHONE_Popular);
    app.get("/product/api/ApiProduct_SAMSUNG_Popular", controller.ApiProduct_SAMSUNG_Popular);
    app.get("/product/api/ApiProduct_OPPO_Popular", controller.ApiProduct_OPPO_Popular);
    app.get("/product/api/ApiProduct_REDMI_Popular", controller.ApiProduct_REDMI_Popular);




};