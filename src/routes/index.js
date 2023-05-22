const {Router} = require('express');
const router = Router();
const {ObtenerRestaurantes,ObtenerReservacionesByid, NuevoRestaurante, ObtenerRestaurantesByCategory} = require('../controllers/index.controller');


//POST
router.post('/restaurantes', NuevoRestaurante);

//GET ALL
router.get('/restaurantes', ObtenerRestaurantes);

//GET BY ID
router.get('/reservaciones/:id', ObtenerReservacionesByid);
router.get('/restaurantes/:id', ObtenerRestaurantesByCategory);



module.exports = router;