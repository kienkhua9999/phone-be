module.exports = (sequelize, Sequelize) => {
    const Contact = sequelize.define("contacts", {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
          },
        contactdate: {
            type: Sequelize.STRING
        },
        content: {
            type: Sequelize.TEXT
        },
      
    });
  
    return Contact;
  };