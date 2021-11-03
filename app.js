const express = require("express");
var path = require('path');
const bodyParser = require("body-parser");
const cors = require("cors");
const db = require("./app/models");
const Sequelize = require("sequelize");
const session = require('express-session');
// db.sequelize.sync();
var urlencodedParser = bodyParser.urlencoded({ extended: false })
const app = express();


var corsOptions = {
    origin: "http://localhost:8081"
  };
  
  app.use(cors(corsOptions));
  
  // parse requests of content-type - application/json
  app.use(bodyParser.json());
  
  // parse requests of content-type - application/x-www-form-urlencoded
  app.use(bodyParser.urlencoded({ extended: true }));


  
app.set('views', path.join(__dirname, 'app/views'));
app.set('view engine', 'ejs');
app.use(express.static(path.join(__dirname, 'app/public')));
  
  // simple route
  app.get("/", (req, res) => {
    res.render("login");
  });
  
  // set port, listen for requests
  const PORT = process.env.PORT || 8080 ;
  app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}.`);
  });
  app.use(session({
    secret: "phamkien-secret-key",
    resave: true,
    saveUninitialized: true,
    cookie: {
        maxAge: 10000 * 60 * 5
    }
}));


// const Role = db.role;

// db.sequelize.sync({force: true}).then(() => {
//   console.log('Drop and Resync Db');
//   initial();
// });
// db.sequelize.sync();

// function initial() {
//   Role.create({
//     id: 1,
//     name: "user"
//   });
 
//   Role.create({
//     id: 2,
//     name: "moderator"
//   });
 
//   Role.create({
//     id: 3,
//     name: "admin"
//   });
// }


require('./app/routes/auth.routes')(app);
require('./app/routes/user.routes')(app);
require('./app/routes/category.routes')(app);
require('./app/routes/product.routes')(app);
require('./app/routes/order.routes')(app);
require('./app/routes/contact.routes')(app);
require('./app/routes/review.routes')(app);
require('./app/routes/index.routes')(app);
require('./app/routes/producer.routes')(app);
require('./app/routes/productImage.routes')(app);