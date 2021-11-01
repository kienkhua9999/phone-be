module.exports = (sequelize, Sequelize) => {
    const ProductImage = sequelize.define("productImages", {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
        ImageUrl  : {
        type: Sequelize.STRING
      }
     
    });
  
    return ProductImage;
  };