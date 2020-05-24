const express = require('express');
const router = express.Router();
const { database } = require('../config/helpers');

/*Get All*/
router.get('/', function (req, res) {
    database.table('categories')
        .withFields(['id', 'title'])
        .getAll().then((list) => {
            if (list.length > 0) {
                res.json({ categories: list, success: true });
            } else {
                res.json({ message: 'NO CATEGORY FOUND', success: false });
            }
        }).catch(err => res.json(err));
});

/*Update category*/
router.put('/update', async (req, res) => {
    let { id, title } = req.body;

    database.table('categories as c')
        .filter({
            'c.id': id
        })
        .update({
            title: title
        })
        .then(categoryObj => {
            if (categoryObj > 0) {
                res.json({ categoryObj, success: true });
            } else {
                res.json({ message: "Category could not found.", success: false });
            }
        }).catch(err => res.json(err));
});

/*Add New Category*/
router.post('/new', async (req, res) => {

    let title = req.body.title;

    database.table('categories')
        .insert({
            title: title,
        }).then((newId) => {
            res.json({ newId, success: true });
        }).catch(err => res.json(err));

});

/*Delete Category*/
router.delete('/delete/:catId', async (req, res) => {

    let catId = req.params.catId;

    database.table('categories as c')
        .filter({ 'c.id': catId})
        .remove()
        .then(successNum => {
            if (successNum > 0) {
                res.status(200).json({
                    successNum: successNum,
                    success: true
                });
            }
            else {
                res.json({ message: "Can not deleted.", success: false });
            }

        })
        .catch(err => console.log(err));
});


module.exports = router;