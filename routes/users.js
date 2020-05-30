const express = require('express');
const router = express.Router();
const { database } = require('../config/helpers');
const bcrypt = require('bcrypt');
/* GET users listing. */
router.get('/', function (req, res) {
    database.table('users')
        .withFields(['username', 'password', 'email', 'fname', 'lname', 'role', 'photoUrl', 'type', 'id'])
        .getAll().then((list) => {
            if (list.length > 0) {
                res.json({ users: list, success: true });
            } else {
                res.json({ message: 'NO USER FOUND', success: false });
            }
        }).catch(err => res.json(err));
});

/**
 * ROLE 777 = ADMIN
 * ROLE 555 = CUSTOMER
 */

/* UPDATE USER DATA */
router.put('/adminUpdate/:userId', async (req, res) => {

    console.log("girdi")
    let userId = req.params.userId;

    let user = await database.table('users').filter({ id: userId }).get();
    if (user) {

        let userEmail = req.body.email;
        let userPassword = req.body.password;
        let userFirstName = req.body.fname;
        let userLastName = req.body.lname;
        let userUsername = req.body.username;
        let role = req.body.role;
        let photoUrl = req.body.photoUrl;
        let type = req.body.type;

        database.table('users as u')
            .filter({
                'u.id': userId
            })
            .update({
                email: userEmail !== undefined ? userEmail : user.email,
                password: userPassword !== undefined ? userPassword : user.password,
                username: userUsername !== undefined ? userUsername : user.username,
                fname: userFirstName !== undefined ? userFirstName : user.fname,
                lname: userLastName !== undefined ? userLastName : user.lname,
                role: role !== undefined ? role : user.role,
                photoUrl: photoUrl !== undefined ? photoUrl : user.photoUrl,
                type: type !== undefined ? type : user.type
            })
            .then(returnValue => {
                if (returnValue > 0) {
                    res.json({ returnValue, success: true });
                } else {
                    res.json({ message: "Rating could not found.", success: false });
                }
            }).catch(err => res.json(err));
    }
});

router.delete('/adminDelete/:userId', async (req, res) => {

    let userId = req.params.userId;

    database.table('users as u')
        .filter({ 'u.id': userId })
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

//Add new rating
router.post('/adminNew', async (req, res) => {

    let userEmail = req.body.email;
    let userPassword = req.body.password;
    let userFirstName = req.body.fname;
    let userLastName = req.body.lname;
    let userUsername = req.body.username;
    let role = req.body.role;
    let photoUrl = req.body.photoUrl;
    let type = req.body.type;

    database.table('users')
        .insert({
            email: userEmail,
            password: userPassword,
            username: userUsername,
            fname: userFirstName,
            lname: userLastName,
            role: role,
            photoUrl: photoUrl,
            type: type
        }).then((newUserId) => {
            res.json({ newUserId, success: true });
        }).catch(err => res.json(err));
});


/* GET ONE USER MATCHING ID */
router.get('/:userId', (req, res) => {
    let userId = req.params.userId;
    database.table('users').filter({ id: userId })
        .withFields(['username', 'email', 'fname', 'lname', 'role', 'type', 'photoUrl', 'id'])
        .get().then(user => {
            if (user) {
                res.json({ user: user, success: true });
            } else {
                res.json({ message: `NO USER FOUND WITH ID : ${userId}`, success: false });
            }
        }).catch(err => res.json(err));
});

/* GET ONE USER WITH EMAIL MATCH  */
router.get('/validate/:email', (req, res) => {

    let email = req.params.email;

    database.table('users').filter({ email: email })
        .get()
        .then(user => {
            if (user) {
                res.json({ user: user, status: true });
            } else {
                res.json({ status: false, user: null });
            }
        })
        .catch(err => res.json(err));


});

/* UPDATE USER DATA */
router.patch('/:userId', async (req, res) => {
    let userId = req.params.userId;     // Get the User ID from the parameter

    // Search User in Database if any
    let user = await database.table('users').filter({ id: userId }).get();
    if (user) {

        let userEmail = req.body.email;
        let userPassword = req.body.password;
        let userFirstName = req.body.fname;
        let userLastName = req.body.lname;
        let userUsername = req.body.username;

        // Replace the user's information with the form data ( keep the data as is if no info is modified )
        database.table('users').filter({ id: userId }).update({
            email: userEmail !== undefined ? userEmail : user.email,
            password: userPassword !== undefined ? userPassword : user.password,
            username: userUsername !== undefined ? userUsername : user.username,
            fname: userFirstName !== undefined ? userFirstName : user.fname,
            lname: userLastName !== undefined ? userLastName : user.lname,
        }).then(result => res.json('User updated successfully')).catch(err => res.json(err));
    }
});

/* UPDATE USER DATA */
router.put('/adminUpdate/:userId', async (req, res) => {

    let userId = req.body.id;     // Get the User ID from the parameter
    let userImage = req.body.photoUrl;
    let userRole = req.body.role;

    // Replace the user's information with the form data ( keep the data as is if no info is modified )
    database.table('users').filter({ id: userId }).update({
        role: userRole,
        photoUrl: userImage,
    }).then(returnValue => {
        if (returnValue > 0) {
            res.json({ returnValue, success: true });
        } else {
            res.json({ message: "User could not found.", success: false });
        }
    })
        .catch(err => res.json(err));

});


router.put('/updateUser/', async (req, res) => {

    let userId = req.body.id;
    let fname = req.body.fname;
    let lname = req.body.lname;
    let password = await bcrypt.hash(req.body.password, 10);

    // Replace the user's information with the form data ( keep the data as is if no info is modified )
    database.table('users').filter({ id: userId }).update({
        fname: fname,
        lname: lname,
        password : password
    }).then(result => res.json({ message : 'User updated successfully' , success : true})).catch(err => res.json(err));
});

module.exports = router;