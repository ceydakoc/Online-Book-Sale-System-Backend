const Mysqli = require('mysqli');

let conn = new Mysqli({
    Host: 'localhost', // IP/domain name 
    post: 3306, // port, default 3306 
    user: 'root', // username 
    passwd: '1234', // password 
    db: 'online-book-sale-system-db'
});

let db = conn.emit(false, ''); //there is no 2 different db

module.exports = {
    database: db
};