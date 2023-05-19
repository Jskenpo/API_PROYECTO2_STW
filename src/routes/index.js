const {Router} = require('express');
const router = Router();
const {ObtenerUsuario,ObtenerRestaurantes,ObtenerReservacionesByid} = require('../controllers/index.controller');


//POST

//GET ALL
router.get('/restaurantes', ObtenerRestaurantes);

//GET BY ID
router.get('/user/:id', ObtenerUsuario);
router.get('/reservaciones/:id', ObtenerReservacionesByid);



module.exports = router;