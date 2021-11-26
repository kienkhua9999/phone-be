const db = require("../models");
const config = require("../config/auth.config");
var pool_db = require("../config/crdb.config").pool_db;

exports.Listbanner = (req, res) => {
  pool_db.connect(function (err, client, done) {
    if (err) {
      return console.error("error", err);
    }
    client.query(
      `SELECT * FROM banners ORDER BY id ASC`,
      function (err, result) {
        done();

        if (err) {
          res.end();
          return console.error("error running query", err);
        }
        res.json(result.rows);
      }
    );
  });
};

exports.addbanner = (req, res) => {
 
  pool_db.connect(function (err, client, done) {
    if (err) {
      return console.error("error", err);
    }
    client.query("INSERT INTO banners VALUES ('" + req.body.id  +"','" +req.body.bannerimg +"','" +req.body.bannerlink + "')",function (err, result) {
        done();

        if (err) {
          res.end();
          return console.error("error running query", err);
        }
        res.status(200).send({ message: "Success!" });
      }
    );
  });
};

exports.Deletebanners = (req, res) => {
  pool_db.connect(function (err, client, done) {
    if (err) {
      return console.error("error", err);
    }
    var id = req.params.id;
    client.query(
      `delete from banners where banners."id"=${id} `,
      function (err, result) {
        done();
        if (err) {
          res.end();
          return console.error("error running query", err);
        }
        res.status(200).send({ message: "Success!" });
      }
    );
  });
};
