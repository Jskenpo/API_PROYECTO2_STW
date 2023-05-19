const {Router} = require('express');
const router = Router();
const {ObtenerUsuario} = require('../controllers/index.controller');


//GET BY ID
router.get('/user/:id', ObtenerUsuario);

module.exports = router;