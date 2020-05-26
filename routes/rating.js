const express = require('express');
const router = express.Router();
const { database } = require('../config/helpers');


//Get all rating
router.get('/', function (req, res) {
    database.table('rating')
        .withFields([ 'id' , 'user_id', 'product_id', 'value'])
        .getAll().then((list) => {
        if (list.length > 0) {
            res.json({ratings: list, success: true });
        } else {
            res.json({message: 'NO RATING FOUND', success: false });
        }
    }).catch(err => res.json(err));
});

router.get('/statistic', function (req, res) {
    database.query ("SELECT p.id as product_id, AVG(r.value) as average , COUNT(r.product_id) as count, p.short_desc, p.image FROM products p LEFT JOIN rating r ON r.product_id = p.id GROUP BY p.id") 
    .then( result  =>  { 
        res.json( result ) 
      }).catch(err => res.json(err));
});

//Update rating
router.put('/update', async (req, res) => {
    let { userId, productId, value} = req.body;

    database.table('rating as r')
        .filter({
            'r.product_id': productId,
            'r.user_id': userId
        })
        .update({
            value: value
        })
        .then(ratingObj => {
            if (ratingObj > 0) {
                res.json({ ratingObj, success: true });
            } else {
                res.json({ message: "Rating could not found.", success: false });
            }
        }).catch(err => res.json(err));
});

//Add new rating
router.post('/new', async (req, res) => {

    let { userId, productId, value } = req.body;

    if (userId !== null) {
        database.table('rating')
            .insert({
                user_id: userId,
                product_id: productId,
                value: value
            }).then((newRatingId) => {
                res.json({ newRatingId, success: true });
            }).catch(err => res.json(err));
    }
    else {
        res.json({ message: 'User not found', success: false });
    }

});

router.delete('/adminDelete/:ratingId', async (req, res) => {

    let ratingId = req.params.ratingId;

    database.table('rating as r')
        .filter({ 'r.id': ratingId })
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

//Get product rating (according to user)
router.get('/:userId/:productId', async (req, res) => {
    let productId = req.params.productId;
    let userId = req.params.userId

    database.table('rating as r')
        .withFields(['r.value'])
        .filter({ 'r.user_id': userId, 'r.product_id': productId })
        .getAll()
        .then(ratingObj => {
            if (ratingObj.length > 0) {
                res.json({ ratingObj, success: true });
            } else {
                res.json({ message: "This product has not rated yet.", success: false });
            }
        }).catch(err => res.json(err));
});

//Get product rating
router.get('/:productId', async (req, res) => {
    let productId = req.params.productId;

    database.table('rating as r')
        .withFields(['r.value'])
        .filter({ 'r.product_id': productId })
        .getAll()
        .then(ratingObj => {
            if (ratingObj.length > 0) {
                var total = 0;
                for (var index = 0; index < ratingObj.length; index++) {
                    total = total + ratingObj[index].value;
                }
                total = total / ratingObj.length;
                console.log(total)

                res.json({ count: ratingObj.length, average: total, success: true });
            } else {
                res.json({ message: "This product has not rated yet.", success: false });
            }
        }).catch(err => res.json(err));
});



module.exports = router;