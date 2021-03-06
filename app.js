const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');
const logger = require('morgan');
const cors = require('cors');
const app = express();


// Import Routes
const usersRouter = require('./routes/users');
const productsRouter = require('./routes/products');
const orderRouter = require('./routes/order');
const authRouter = require('./routes/auth');
const favoritesRouter = require('./routes/favorites');
const ratingRouter = require('./routes/rating');
const categoryRouter = require('./routes/category');
const contactRouter = require('./routes/contact');
const logRouter = require('./routes/log');

/* CORS */
app.use(cors({
    origin: '*',
    methods: ['GET', 'PUT', 'DELETE', 'PATCH', 'POST'],
    allowedHeaders: 'Content-Type, Authorization, Origin, X-Requested-With, Accept'
}));

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));


//Use Routes
app.use('/api/users', usersRouter);
app.use('/api/products', productsRouter);
app.use('/api/orders', orderRouter);
app.use('/api/auth',authRouter);
app.use('/api/favorites',favoritesRouter);
app.use('/api/rating',ratingRouter);
app.use('/api/category',categoryRouter);
app.use('/api/contact',contactRouter);
app.use('/api/log',logRouter);

module.exports = app;

