const { Pool } = require('pg');

const pool = new Pool({
    user: 'postgres',
    host: 'proyecto2-stw.c64q2jpilfie.us-east-2.rds.amazonaws.com',
    database: 'PROYECTO2',
    password: 'ClaveRDS#2',
    port: 5432,
});