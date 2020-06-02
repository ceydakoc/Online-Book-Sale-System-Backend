const express = require('express');
const router = express.Router();
const { database } = require('../config/helpers');

/*Get All Message*/
router.get('/', function (req, res) {

    database.query("select * from messages as m ORDER BY m.date desc")
        .then((list) => {
            if (list.length > 0) {
                res.json({ messages: list, success: true });
            } else {
                res.json({ message: 'NO MESSAGES FOUND', success: false });
            }
        }).catch(err => res.json(err));
});

//get single message
router.get('/getSingle/:id', async (req, res) => {

    let messageId = req.params.id;

    database.table('messages as m')
        .withFields(['id', 'name', 'email', 'date', 'subject', 'message'])
        .filter({ 'm.id': messageId })
        .getAll()
        .then(message => {
            if (message.length > 0) {
                res.json({ message: messsage, success: true });
            } else {
                res.json({ message: "No message found", success: false });
            }
        }).catch(err => res.json(err));
});

router.get('/unread', function (req, res) {
    database.query("SELECT COUNT(id)" +
        "FROM messages" +
        "WHERE isRead = false")
        .then(count => {
            res.json(count)
        }).catch(err => res.json(err));
});

router.put('/update', async (req, res) => {
    let id = req.body.id
    let isRead = req.body.isRead;

    database.table('messages as m')
        .filter({
            'm.id': id,
        })
        .update({
            isRead: isRead
        })
        .then(message => {
            if (message > 0) {
                res.json({ message, success: true });
            } else {
                res.json({ message: "Message could not found.", success: false });
            }
        }).catch(err => res.json(err));
});


/*Add New Message*/
router.post('/new/', async (req, res) => {

    let name = req.body.name;
    let email = req.body.email;
    let subject = req.body.subject;
    let message = req.body.message;

    database.table('messages')
        .insert({
            name: name,
            email: email,
            subject: subject,
            message: message,
        }).then((newId) => {
            res.json({ newId: newId, success: true });
        }).catch(err => res.json(err));

});


module.exports = router;