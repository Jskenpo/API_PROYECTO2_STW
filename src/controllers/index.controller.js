const { Pool } = require('pg');

const pool = new Pool({
    user: 'postgres',
    host: 'proyecto2-stw.c64q2jpilfie.us-east-2.rds.amazonaws.com',
    database: 'PROYECTO2',
    password: 'ClaveRDS#2',
    port: 5432,
});


const ObtenerUsuario  = async (req, res) => {
    const id = parseInt(req.params.id);
    const consulta = `select * from usuarios where id_usuario = $1`;
    try {
        const response = await pool.query(consulta, [id]);
        console.log(response.rows);
        res.status(200).json(response.rows);
    } catch (e) {
        console.log(e);
    }
}

const ObtenerRestaurantes  = async (req, res) => {
    const consulta = `select * from restaurantes`;
    try {
        const response = await pool.query(consulta);
        console.log(response.rows);
        res.status(200).json(response.rows);
    } catch (e) {
        console.log(e);
    }
}

const ObtenerReservacionesByid = async (req, res) => {
    const id = parseInt(req.params.id);
    const consulta = `
    select u.usuario, r.nombre_restaurante, re.hora, re.cant_presonas, re.fecha
    from usuarios u
    inner join reservas re on u.id_usuario = re.id_usuario
    inner join restaurantes r on r.id_restaurante = re.id_restaurante
    where u.id_usuario = $1;
    `;
    try {
        const response = await pool.query(consulta, [id]);
        console.log(response.rows);
        res.status(200).json(response.rows);
    } catch (e) {
        console.log(e);
    }
}

module.exports = {
    ObtenerUsuario,
    ObtenerRestaurantes,
    ObtenerReservacionesByid
}