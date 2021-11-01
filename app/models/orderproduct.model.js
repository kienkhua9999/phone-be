module.exports = (sequelize, Sequelize) => {
    const OrderProduct = sequelize.define("orderproducts", {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
        orderate  : {
        type: Sequelize.STRING
      },
      totalPrice: {
        type: Sequelize.FLOAT
      },
      status: {
        type: Sequelize.BOOLEAN
      }
    });
  
    return OrderProduct;
  };