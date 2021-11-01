const config = require("../config/db.config.js");

const Sequelize = require("sequelize");
const sequelize = new Sequelize(
  config.DB,
  config.USER,
  config.PASSWORD,
  {
    host: config.HOST,
    dialect: config.dialect,
    operatorsAliases: false,

    pool: {
      max: config.pool.max,
      min: config.pool.min,
      acquire: config.pool.acquire,
      idle: config.pool.idle
    }
  }
);

const db = {};

db.Sequelize = Sequelize;
db.sequelize = sequelize;

db.user = require("../models/user.model.js")(sequelize, Sequelize);
db.role = require("../models/role.model.js")(sequelize, Sequelize);
db.category = require("../models/category.model.js")(sequelize, Sequelize);
db.producer = require("../models/producer.model.js")(sequelize, Sequelize);
db.product = require("../models/product.model.js")(sequelize, Sequelize);
db.orderproduct = require("../models/orderproduct.model")(sequelize, Sequelize);
db.orderdetail = require("../models/orderdetail.model.js")(sequelize, Sequelize);
db.productImage = require("../models/productImage.model.js")(sequelize, Sequelize);
db.review = require("../models/review.model.js")(sequelize, Sequelize);
db.contact = require("../models/contact.model.js")(sequelize, Sequelize);


db.role.belongsToMany(db.user, {
  through: "user_roles",
  foreignKey: "roleId",
  otherKey: "userId"
});
db.user.belongsToMany(db.role, {
  through: "user_roles",
  foreignKey: "userId",
  otherKey: "roleId"
});

db.ROLES = ["user", "admin", "moderator"];

db.review.belongsTo(db.user, { foreignKey: 'userId' });
db.review.belongsTo(db.product, { foreignKey: 'productId' });
db.contact.belongsTo(db.user, { foreignKey: 'userId' });
db.orderproduct.belongsTo(db.user, { foreignKey: 'userId' });
db.product.belongsTo(db.category, { foreignKey: 'categoryId' });
db.product.belongsTo(db.producer, { foreignKey: 'producerId' });
db.orderdetail.belongsTo(db.orderproduct, { foreignKey: 'orderId' });
db.orderdetail.belongsTo(db.product, { foreignKey: 'productId' });
db.productImage.belongsTo(db.product, { foreignKey: 'productId' });

module.exports = db;