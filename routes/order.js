const express = require('express');
const router = express.Router();
const { database } = require('../config/helpers');
const crypto = require('crypto');

// GET ALL ORDERS
router.get('/', (req, res) => {
    database.table('orders_details as od')
        .join([
            {
                table: 'orders as o',
                on: 'o.id = od.order_id'
            },
            {
                table: 'products as p',
                on: 'p.id = od.product_id'
            },
            {
                table: 'users as u',
                on: 'u.id = o.user_id'
            }
        ])
        .withFields(['o.id', 'p.title', 'p.description', 'p.price', 'u.username','p.image','od.quantity as quantityOrdered', 'o.address'])
        .getAll()
        .then(orders => {
            if (orders.length > 0) {
                res.json(orders);
            } else {
                res.json({ message: "No orders found" });
            }

        }).catch(err => res.json(err));
});

router.get('/getAdmin/', (req, res) => {
    database.table('orders as o')
        .join([
            {
                table: 'users as u',
                on: 'u.id = o.user_id'
            }
        ])
        .withFields(['o.id', 'o.user_id', 'u.username', 'o.total', 'o.date', 'o.address'])
        .getAll()
        .then(orders => {
            if (orders.length > 0) {
                res.json({orders: orders, success: true});
            } else {
                res.json({ message: "No orders found" , success: false});
            }

        }).catch(err => res.json(err));
});

//Delete Order
router.delete('/delete/:orderId', async (req, res) => {

    let orderId = req.params.orderId;

    database.table('orders as o')
        .filter({ 'o.id': orderId })
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

// GET ALL ORDERS ACCORDING TO USER
router.get('/myOrders/:userId', (req, res) => {
    console.log(req.params.userId)
    database.table('orders as o')
        .join()
        .filter({ 'o.user_id': req.params.userId })
        .withFields(['o.id', 'o.user_id', 'o.total', 'o.date', 'o.address'])
        .getAll()
        .then(orders => {
            if (orders.length > 0) {
                res.json(orders);
            } else {
                res.json({ message: "No orders found" });
            }

        }).catch(err => res.json(err));
});


// Get Single Order
router.get('/:id', async (req, res) => {
    let orderId = req.params.id;
    console.log("order" + orderId);

    database.table('orders_details as od')
        .join([
            {
                table: 'orders as o',
                on: 'o.id = od.order_id'
            },
            {
                table: 'products as p',
                on: 'p.id = od.product_id'
            },
            {
                table: 'users as u',
                on: 'u.id = o.user_id'
            }
        ])
        .withFields(['o.id', 'p.id as product_id', 'p.title', 'p.description', 'p.price', 'p.image', 'od.quantity as quantityOrdered', 'o.address'])
        .filter({ 'o.id': orderId })
        .getAll()
        .then(orders => {
            console.log(orders);
            if (orders.length > 0) {
                res.json(orders);
            } else {
                res.json({ message: "No orders found" });
            }

        }).catch(err => res.json(err));
});

// Place New Order
router.post('/new', async (req, res) => {
    // let userId = req.body.userId;
    // let data = JSON.parse(req.body);
    let { userId, products, orderDate, orderTotal, address } = req.body;

    if (userId !== null && userId > 0) {
        database.table('orders')
            .insert({
                user_id: userId,
                date: orderDate,
                total: orderTotal,
                address: address
            }).then((newOrderId) => {

                if (newOrderId > 0) {
                    products.forEach(async (p) => {

                        let data = await database.table('products').filter({ id: p.id }).withFields(['quantity']).get();

                        let inCart = parseInt(p.incart);

                        // Deduct the number of pieces ordered from the quantity in database
                        console.log(data);
                        console.log(inCart)
                        if (data.quantity >= inCart) {
                            console.log("Equal")
                            data.quantity = data.quantity - inCart;
                            // Insert order details w.r.t the newly created order Id
                            database.table('orders_details')
                                .insert({
                                    order_id: newOrderId,
                                    product_id: p.id,
                                    quantity: inCart
                                }).then(newId => {
                                    database.table('products')
                                        .filter({ id: p.id })
                                        .update({
                                            quantity: data.quantity
                                        }).then(successNum => {
                                        }).catch(err => console.log(err));
                                }).catch(err => console.log(err));
                            res.json({
                                message: `Order successfully placed with order id ${newOrderId}`,
                                success: true,
                                order_id: newOrderId,
                                products: products
                            })
                        }
                        else {
                            res.json({ message: 'New order failed while adding order details because of stock', success: false });
                        }

                    });


                } else {
                    res.json({ message: 'New order failed while adding order details', success: false });
                }

            }).catch(err => res.json(err));
    }

    else {
        res.json({ message: 'New order failed', success: false });
    }

});

// Payment Gateway
router.post('/payment', (req, res) => {
    setTimeout(() => {
        res.status(200).json({ success: true });
    }, 3000)
});






module.exports = router;
