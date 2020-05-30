const express = require('express');
const router = express.Router();
const { database } = require('../config/helpers');

/*Get All Logs*/
router.get('/', function (req, res) {
    database.query ("SELECT *" +  
    "FROM logs " +
     "ORDER BY date desc") 
    .then( list  =>  { 
        if (list.length > 0) {
            res.json({ logs: list, success: true });
        } else {
            res.json({ logs: 'NO LOGS FOUND', success: false });
        }
      }).catch(err => res.json(err));
});

/*Add New Log*/
router.post('/new/', async (req, res) => {

    let description = req.body.description;
    let type = req.body.type;

    database.table('logs')
        .insert({
            description: description,
            type: type        
        }).then((newId) => {
            res.json({ newId: newId, success: true });
        }).catch(err => res.json(err));

});

module.exports = router;