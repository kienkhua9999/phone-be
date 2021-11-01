module.exports = (sequelize, Sequelize) => {
    const OrderDetail = sequelize.define("orderdetails", {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
        Quantity  : {
        type: Sequelize.INTEGER
      },
      price: {
        type: Sequelize.FLOAT
      }
      
    });
  
    return OrderDetail;
  };