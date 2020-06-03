const express = require('express');
const router = express.Router();
const { database } = require('../config/helpers');

/* GET all admin */
router.get('/admin/', function (req, res) { 
    database.table('products as p')
        .join([
            {
                table: "categories as c",
                on: `c.id = p.cat_id`
            }
        ])
        .withFields([
            'p.id',
            'p.title',
            'p.image',
            'p.images',
            'p.description',
            'p.price',
            'p.quantity',
            'p.short_desc',
            'p.cat_id',
            'c.title as cat_title'
        ]).sort({ id: 1 })
        .getAll()
        .then(prods => {
            if (prods.length > 0) {
                res.status(200).json({
                    products: prods,
                    success: true
                });
            } else {
                res.json({ message: "No products found", success: false });
            }
        })
        .catch(err => console.log(err));
});

/* UPDATE admin */
router.put('/adminUpdate/:productId', async (req, res) => {
    let productId = req.params.productId;

    let title = req.body.title;
    let image = req.body.image;
    let images = req.body.images;
    let description = req.body.description;
    let price = req.body.price;
    let quantity = req.body.quantity;
    let short_desc = req.body.short_desc;
    let cat_id = req.body.cat_id;

    var query;
    if (images == null) {
        query = "UPDATE products set title = '" + title + "', image = '" + image + "', images = " + null + ", description = '" + description +
            "', price = " + price + ", quantity = " + quantity + ", short_desc = '" + short_desc + "', cat_id = " + cat_id + " where id = " + productId
    }
    else {
        query = "UPDATE products set title = '" + title + "', image = '" + image + "', images = '" + images + "', description = '" + description +
            "', price = " + price + ", quantity = " + quantity + ", short_desc = '" + short_desc + "', cat_id = " + cat_id + " where id = " + productId
    }
    console.log(query);
    database.query(query)
        .then(result => {

            res.json({ result, success: true });

        }).catch(err => res.json(err));

});

//Add new product
router.post('/adminNew/', async (req, res) => {

    let title = req.body.title;
    let image = req.body.image;
    let images = req.body.images;
    let description = req.body.description;
    let price = req.body.price;
    let quantity = req.body.quantity;
    let short_desc = req.body.short_desc;
    let cat_id = req.body.cat_id;

    database.table('products')
        .insert({
            title: title,
            image: image,
            images: images,
            description,
            price: price,
            quantity: quantity,
            short_desc: short_desc,
            cat_id: cat_id
        }).then((newId) => {
            res.json({ newId: newId, success: true });
        }).catch(err => res.json(err));
});

router.get('/topSelling', function (req, res) {
    database.query("SELECT p.id, p.title, p.image, p.images, p.description, p.quantity, p.cat_id, p.short_desc, p.price, c.title as category, SUM(od.quantity) as sum "
        + "FROM products p LEFT JOIN orders_details od ON od.product_id = p.id "
        + "INNER JOIN categories c ON c.id = p.cat_id "
        + "GROUP BY p.id "
        + "ORDER BY sum desc")
        .then(result => {
            res.json(result)
        }).catch(err => res.json(err));
});

router.delete('/adminDelete/:productId', async (req, res) => {

    let productId = req.params.productId;

    database.table('products as p')
        .filter({ 'p.id': productId })
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

/* GET all OF PRODC */
router.get('/', function (req, res) {       // Sending Page Query Parameter is mandatory http://localhost:3636/api/products?page=1
    database.table('products as p')
        .join([
            {
                table: "categories as c",
                on: `c.id = p.cat_id`
            }
        ])
        .withFields([
            'p.title as name',
            'p.price',
            'p.quantity',
            'p.description',
            'p.image',
            'p.id',
            'p.short_desc',
            'c.title as category'
        ]).sort({ id: 1 })
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

/* GET single product admin */
router.get('/adminGetSingle/:prodId', (req, res) => {
    let productId = req.params.prodId;
    database.table('products as p')
        .join([
            {
                table: "categories as c",
                on: `c.id = p.cat_id`
            }
        ])
        .withFields([
            'p.id',
            'p.title',
            'p.image',
            'p.images',
            'p.description',
            'p.price',
            'p.quantity',
            'p.short_desc',
            'p.cat_id',
            'c.title as cat_title'
        ])
        .filter({ 'p.id': productId })
        .get()
        .then(prod => {
            console.log(prod);
            if (prod) {
                res.status(200).json({ prod: prod, success: true });
            } else {
                res.json({ message: `No product found with id ${productId}`, success: false });
            }
        }).catch(err => res.json(err));
});

/* GET single product. */
router.get('/:prodId', (req, res) => {
    let productId = req.params.prodId;
    database.table('products as p')
        .join([
            {
                table: "categories as c",
                on: `c.id = p.cat_id`
            }
        ])
        .withFields(['c.title as category',
            'p.title as name',
            'p.price',
            'p.quantity',
            'p.description',
            'p.image',
            'p.id',
            'p.images'
        ])
        .filter({ 'p.id': productId })
        .get()
        .then(prod => {
            console.log(prod);
            if (prod) {
                res.status(200).json(prod);
            } else {
                res.json({ message: `No product found with id ${productId}` });
            }
        }).catch(err => res.json(err));
});

/* GET all products from one category. */
router.get('/category/:catName', (req, res) => { // Sending Page Query Parameter is mandatory http://localhost:3636/api/products/category/categoryName?page=1
    let page = (req.query.page !== undefined && req.query.page !== 0) ? req.query.page : 1;   // check if page query param is defined or not
    const limit = (req.query.limit !== undefined && req.query.limit !== 0) ? req.query.limit : 10;   // set limit of items per page
    let startValue;
    let endValue;
    if (page > 0) {
        startValue = (page * limit) - limit;      // 0, 10, 20, 30
        endValue = page * limit;                  // 10, 20, 30, 40
    } else {
        startValue = 0;
        endValue = 10;
    }

    // Get category title value from param
    const cat_title = req.params.catName;

    database.table('products as p')
        .join([
            {
                table: "categories as c",
                on: `c.id = p.cat_id WHERE c.title LIKE '%${cat_title}%'`
            }
        ])
        .withFields(['c.title as category',
            'p.title as name',
            'p.price',
            'p.quantity',
            'p.description',
            'p.image',
            'p.id'
        ])
        .slice(startValue, endValue)
        .sort({ id: 1 })
        .getAll()
        .then(prods => {
            if (prods.length > 0) {
                res.status(200).json({
                    count: prods.length,
                    products: prods
                });
            } else {
                res.json({ message: `No products found matching the category ${cat_title}` });
            }
        }).catch(err => res.json(err));

});

module.exports = router;
