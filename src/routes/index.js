const {Router} = require('express');
const router = Router();
const {ObtenerRestaurantes,ObtenerReservacionesByid, NuevoRestaurante, ObtenerRestaurantesByCategory, EliminarReservación, NuevaReservacion} = require('../controllers/index.controller');


//POST
router.post('/restaurantes', NuevoRestaurante);
router.post('/reservaciones', NuevaReservacion);

//GET ALL
router.get('/restaurantes', ObtenerRestaurantes);

//GET BY ID
router.get('/reservaciones/:id', ObtenerReservacionesByid);
router.get('/restaurantes/:id', ObtenerRestaurantesByCategory);

//DELETE
router.delete('/reservaciones/:id', EliminarReservación);


module.exports = router;