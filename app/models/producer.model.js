module.exports = (sequelize, Sequelize) => {
    const Producer = sequelize.define("producers", {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
        producerName  : {
        type: Sequelize.STRING
      },
      address: {
        type: Sequelize.STRING
      }
     
    });
  
    return Producer;
  };