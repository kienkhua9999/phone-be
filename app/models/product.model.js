module.exports = (sequelize, Sequelize) => {
    const Product = sequelize.define("products", {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
      productName: {
        type: Sequelize.STRING
      },
      description: {
        type: Sequelize.TEXT
      },
      guarantee: {
        type: Sequelize.STRING
      },
      makingDate: {
        type: Sequelize.STRING
      },
      price: {
        type: Sequelize.FLOAT
      },
      quantity: {
        type: Sequelize.INTEGER
      },
      saleOff: {
        type: Sequelize.FLOAT
      },
      imageUrl: {
        type: Sequelize.TEXT
      },
      status: {
        type: Sequelize.BOOLEAN
      },
     

    });
  
    return Product;
  };