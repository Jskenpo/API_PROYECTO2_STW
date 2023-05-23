const {Router} = require('express');
const router = Router();
const {ObtenerRestaurantes,
       ObtenerReservacionesByid, 
       NuevoRestaurante, 
       ObtenerRestaurantesByCategory, 
       EliminarReservación, 
       NuevaReservacion,
       RestaurantesRaw} = require('../controllers/index.controller');


//POST
router.post('/restaurantes', NuevoRestaurante);
router.post('/reservaciones', NuevaReservacion);

//GET ALL
router.get('/restaurantes', ObtenerRestaurantes);
router.get('/restaurantes/raw', RestaurantesRaw);


//GET BY ID
router.get('/reservaciones/:id', ObtenerReservacionesByid);
router.get('/restaurantes/:id', ObtenerRestaurantesByCategory);

//DELETE
router.delete('/reservaciones/:id', EliminarReservación);


module.exports = router;