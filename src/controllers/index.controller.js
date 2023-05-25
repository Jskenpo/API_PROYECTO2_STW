const { Pool } = require('pg');
const fs = require('fs');
const path = require('path');
const multer = require('multer');

const pool = new Pool({
    user: 'postgres',
    host: 'proyecto2-stw.c64q2jpilfie.us-east-2.rds.amazonaws.com',
    database: 'PROYECTO2',
    password: 'ClaveRDS#2',
    port: 5432,
});

const ObtenerRestaurantes = async (req, res) => {
    const consulta = `
    SELECT res.id_restaurante, res.nombre_restaurante, res.descripcion, res.hora_apertura, res.hora_cerrada, cat.categoria
    FROM restaurantes res
    INNER JOIN categorias cat ON res.id_categoría = cat.id_categoria;
  `;
    try {
        const response = await pool.query(consulta);
        const restaurantes = response.rows;

        // Agregar la propiedad 'imagen' a cada restaurante con la ruta del archivo correspondiente
        const restaurantesConImagen = restaurantes.map(restaurante => ({
            ...restaurante,
            imagen: path.join(__dirname, '../imas', `${restaurante.id_restaurante}.jpg`),
        }));

        // Leer el contenido de cada archivo de imagen y convertirlo a base64
        const restaurantesConImagenBase64 = await Promise.all(
            restaurantesConImagen.map(async restaurante => ({
                ...restaurante,
                imagen: fs.readFileSync(restaurante.imagen, { encoding: 'base64' }),
            }))
        );

        res.status(200).json(restaurantesConImagenBase64);
    } catch (error) {
        console.log(error);
        res.status(500).json({ error: 'Error en el servidor' });
    }
};

const ObtenerRestaurantesByCategory = async (req, res) => {
    const id = parseInt(req.params.id);
    const consulta = `
    select res.id_restaurante, res.nombre_restaurante, res.descripcion, res.hora_apertura, res.hora_cerrada, cat.categoria
    from restaurantes res
    inner join categorias cat on res.id_categoría = cat.id_categoria
    where res.id_categoría = $1;
    `
    try {
        const response = await pool.query(consulta, [id]);
        const restaurantes = response.rows;

        // Agregar la propiedad 'imagen' a cada restaurante con la ruta del archivo correspondiente
        const restaurantesConImagen = restaurantes.map(restaurante => ({
            ...restaurante,
            imagen: path.join(__dirname, '../imas', `${restaurante.id_restaurante}.jpg`),
        }));

        // Leer el contenido de cada archivo de imagen y convertirlo a base64
        const restaurantesConImagenBase64 = await Promise.all(
            restaurantesConImagen.map(async restaurante => ({
                ...restaurante,
                imagen: fs.readFileSync(restaurante.imagen, { encoding: 'base64' }),
            }))
        );

        res.status(200).json(restaurantesConImagenBase64);
    } catch (error) {
        console.log(error);
        res.status(500).json({ error: 'Error en el servidor' });
    }

}


const ObtenerReservacionesByid = async (req, res) => {
    const id = parseInt(req.params.id);
    const consulta = `
    select r.id_reserva, r.cliente, r.hora, r.fecha_reserva, r.cant_personas
    from reservas r
    inner join restaurantes re on r.id_restaurante = re.id_restaurante
    where r.id_restaurante = $1;
    ;
    `;
    try {
        const response = await pool.query(consulta, [id]);
        console.log(response.rows);
        res.status(200).json(response.rows);
    } catch (e) {
        console.log(e);
    }
}

const NuevoRestaurante = async (req, res) => {
    const { usuario, contraseña, nombre_restaurante, descripcion, hora_apertura, hora_cerrada, id_categoría } = req.body;
    const consulta = `
    insert into restaurantes (usuario,contraseña,nombre_restaurante, descripcion, hora_apertura, hora_cerrada, id_categoría)
    values ($1, $2, $3, $4, $5, $6, $7);
    `;
    try {
        const response = await pool.query(consulta, [usuario, contraseña, nombre_restaurante, descripcion, hora_apertura, hora_cerrada, id_categoría]);
        console.log(response);
        res.status(200).json({
            message: 'Restaurante agregado correctamente',
            body: {
                user: { nombre_restaurante, descripcion, hora_apertura, hora_cerrada, id_categoría }
            }
        })
    } catch (e) {
        console.log(e);
    }
}


const EliminarReservación = async (req, res) => {
    const id = parseInt(req.params.id);
    const consulta = `
    delete from reservas where id_reserva = $1;
    `;
    try {
        const response = await pool.query(consulta, [id]);
        console.log(response);
        res.status(200).json(`Reservación ${id} eliminada correctamente`);
    } catch (e) {
        console.log(e);
    }
}

const NuevaReservacion = async (req, res) => {
    const { id_restaurante ,cliente, hora, fecha_reserva, cant_personas } = req.body;
    const consulta = `
    insert into reservas (id_restaurante, cliente, hora, fecha_reserva, cant_personas)
    values ($1, $2, $3, $4, $5);
    `;
    try {
        const response = await pool.query(consulta, [id_restaurante ,cliente, hora, fecha_reserva, cant_personas]);
        console.log(response);
        res.status(200).json({
            message: 'Reservación agregada correctamente',
            body: {
                user: { id_restaurante ,cliente, hora, fecha_reserva, cant_personas }
            }
        })
    } catch (e) {
        console.log(e);
    }
}

const RestaurantesRaw = async (req, res) => {
    const consulta = `
    select * from restaurantes;
    `;
    try {
        const response = await pool.query(consulta);
        console.log(response.rows);
        res.status(200).json(response.rows);
    } catch (e) {
        console.log(e);
    }
}





module.exports = {
    ObtenerRestaurantes,
    ObtenerReservacionesByid,
    NuevoRestaurante,
    ObtenerRestaurantesByCategory,
    EliminarReservación,
    NuevaReservacion,
    RestaurantesRaw
}