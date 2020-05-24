const express = require('express');
const router = express.Router();
const { database } = require('../config/helpers');

/*Get All*/
router.get('/', function (req, res) {
    database.table('favorites')
        .withFields([ 'id' , 'user_id', 'product_id'])
        .getAll().then((list) => {
        if (list.length > 0) {
            res.json({favorites: list, success: true });
        } else {
            res.json({message: 'NO FAVORITE FOUND', success: false });
        }
    }).catch(err => res.json(err));
});

router.post('/new', async (req, res) => {

    let { userId, productId } = req.body;

    if (userId !== null) {
        database.table('favorites')
            .insert({
                user_id: userId,
                product_id: productId,
            }).then((newFavoriteId) => {
                res.json({newFavoriteId, success: true});
            }).catch(err => res.json(err));
    }
    else {
        res.json({ message: 'User not found', success: false });
    }

});

router.get('/:userId/:productId', async (req, res) => {
    let productId = req.params.productId;
    let userId = req.params.userId

    database.table('favorites as f')
        .withFields(['f.id', 'f.product_id', 'f.user_id'])
        .filter({ 'f.user_id': userId, 'f.product_id': productId })
        .getAll()
        .then(favoritedProd => {
            if (favoritedProd.length > 0) {
                res.json({favoritedProd,success:true});
            } else {
                res.json({ message: "This product did not add favorites" ,success:false});
            }
        }).catch(err => res.json(err));
});

router.get('/:userId', async (req, res) => {

    let userId = req.params.userId

    database.table('favorites as f')
        .join([
            {
                table: 'products as p',
                on: 'p.id = f.product_id'
            },
            {
                table: 'categories as c',
                on: 'c.id = p.cat_id'
            }
        ])
        .withFields(['c.title as category',
            'p.title as name',
            'p.price',
            'p.quantity',
            'p.description',
            'p.image',
            'p.id'])
        .filter({ 'f.user_id': userId })
        .sort({ id: 1 })
        .getAll()
        .then(prods => {
            if (prods.length > 0) {
                res.status(200).json({
                    count: prods.length,
                    products: prods
                });
            } else {
                res.json({ message: "No products found" });
            }
        })
        .catch(err => console.log(err));
});

router.delete('/:userId/:productId', async (req, res) => {

    let userId = req.params.userId;
    let productId = req.params.productId;

    database.table('favorites as f')
        .filter({ 'f.user_id': userId, 'f.product_id': productId })
        .remove()
        .then(successNum   => {
            if(successNum > 0){
                res.status(200).json({
                    successNum : successNum,
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