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

module.exports = {
    ObtenerUsuario
}