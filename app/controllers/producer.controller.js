const db = require("../models");
const Producer = db.producer;
const Op = db.Sequelize.Op;
var pool_db = require("../config/crdb.config").pool_db;
const config = require("../config/auth.config");



exports.producer = (req, res) => {
   
    pool_db.connect(function (err, client, done) {
        if (err) {
            return console.error('error', err);
        }
   
        client.query("SELECT * FROM producers ORDER BY id ASC" , function (err, result) {
            done();

            if (err) {
                res.end();
                return console.error('error running query', err);
            }
            // console.log(result.rows[2]);
            res.render("./listproducer.ejs", { producers: result });
        });
    });
};

// post
exports.fromInsert = (req, res) => {
    res.render("./insertproducer.ejs");
};

exports.addProducer = (req, res) => {
    pool_db.connect(function (err, client, done) {
        var id = req.body.id;
        var producername = req.body.producername;
        var address = req.body.address;
        client.query("INSERT INTO producers VALUES ('" + id + "','" + producername + "','" + address + "')", function (err, result) {
            done();

            if (err) {
                res.end();
                return console.error('error running query', err);
            }
            // console.log(result.rows[0].id);
            res.redirect("../producer/listproducer");

        });
    });
};
//put
exports.fromUpdate = (req, res) => {
    pool_db.connect(function (err, client, done) {
        if (err) {
            return console.error('error', err);
        }
        var id = req.params.id;
        client.query("SELECT * FROM producers WHERE id='" + id + "'", function (err, result) {
            done();

            if (err) {
                res.end();
                return console.error('error running query', err);
            }
            // console.log(result.rows[0]);
            res.render("./updateproducer.ejs", { producers: result.rows[0] });
        });
    });
};

exports.updateProducer = async (req, res) => {
    pool_db.connect(function (err, client, done) {
        if (err) {
            return console.error('error', err);
        } else {

            client.query(`UPDATE producers SET "producerName" = '${req.body.producername}' , "address" = '${req.body.address}' WHERE "id" = ${req.params.id} `, function (err, result) {
                done();

                if (err) {
                    res.end();
                    return console.error('error running query updarte', err);
                } else {

                    res.redirect("../../producer/listproducer");
                }
            });
        }

    });

};
//delete
exports.deleteProducer = async (req, res) => {

    await Producer.destroy({
        where: {
            id: req.params.id
        }
    }
    )
    await res.redirect("../../producer/listproducer");



};