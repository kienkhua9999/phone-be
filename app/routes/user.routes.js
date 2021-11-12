const { authJwt } = require("../middleware");
const controller = require("../controllers/user.controller");

module.exports = function (app) {
  app.use(function (req, res, next) {
    res.header(
      "Access-Control-Allow-Headers",
      "x-access-token, Origin, Content-Type, Accept"
    );
    next();
  });
  app.get("/api/test/all", controller.allAccess);

  app.get(
    "/api/test/user",
    [authJwt.verifyToken,authJwt.isUser],
    controller.userBoard
  );

  app.get(
    "/api/test/mod",
    [authJwt.verifyToken, authJwt.isModerator],
    controller.moderatorBoard
  );

  app.get(
    "/api/test/admin",
    [authJwt.verifyToken, authJwt.isAdmin],
    controller.adminBoard
  );

  app.get("/user/listuser", controller.listUser
  );

  app.get("/user/adduser", controller.fromInsert);
  app.post('/user/adduser', controller.addUser);

  app.get("/user/updateuser/:id", controller.fromUpdate);
  app.post("/user/updateuser/:id", controller.updateUser);

  app.get("/user/deleteuser/:id", controller.deleteUser);
  app.get("/user/detailuser/:id", controller.Detailuser);

  app.post("/", controller.signin);
  app.get("/user/api/listuser", controller.APIlistUser);
  app.get("/user/api/detailuser/:id", controller.ApiDetailuser);
};