module.exports = (sequelize, Sequelize) => {
  const Category = sequelize.define("categories", {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    parentId: {
      type: Sequelize.INTEGER
    },
    categoryName: {
      type: Sequelize.STRING
    },
    categoryLevel: {
      type: Sequelize.INTEGER,
      defaultValue: 1
  },

  });

  return Category;
};

