module.exports = (sequelize, Sequelize) => {
    const Review = sequelize.define("reviews", {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
          },
        reviewDate: {
            type: Sequelize.STRING
        },
        reviewContent: {
            type: Sequelize.TEXT
        },
        numberStar: {
            type: Sequelize.INTEGER
        },
        reviewImg: {
            type: Sequelize.TEXT
        },
    });

    return Review;
};