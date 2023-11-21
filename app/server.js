
// Siempre que se actulice el package-lock.json y package.json
// ejecutar npm install
// Para correr el servidor ejecutar >node server.js

// EXPRESS
let express = require('express');
let app = express();

// MYSQL
let mysql = require('mysql');
var connection = mysql.createConnection({
 host : 'mysql-db',
 user : process.env.DB_USER,
 password : process.env.DB_PASS, 
 database : process.env.MYSQL_DATABASE
})

// CORS
const cors = require('cors');
var corsOptions = {
  origin: '*', // solo permite este origen
  methods: 'GET,HEAD,PUT,PATCH,POST,DELETE', // metodos permitidos
  optionsSuccessStatus: 200 // status
 }
app.use(cors(corsOptions));

// DOTENV
require('dotenv').config({ debug: true });
let db = mysql.createConnection({
  host: 'mysql-db',
  user: process.env.DB_USER, // importante crear el usuario y dar privilegios para acceder a mydb
  password: process.env.DB_PASS, // y colocar esta password
  database: process.env.DB_NAME
});

db.connect(function(err) {
  if (err) {
    console.error('Error conectando a MySQL: ' + err.stack)
    throw err;
  }
  console.log('Conectado a MYSQL con id' + connection.threadId);
});

app.get('/api/productos', (req, res) => {
  // recibe params, se guardan si llegan sino es null
  const { repositorId, sectorId } = req.query;

  // se declara la query principal que recibe todos los productos
  let query = 'SELECT gp.id_producto, p.nombre, g.nombre AS nombreGondola, pres.desc_presentacion, gpr.fecha, gpr.cantidad' +
  ' FROM Gondola_Producto AS gp INNER JOIN producto AS  p on gp.id_producto = p.id_producto' +
  ' INNER JOIN gondola AS g on gp.id_gondola = g.id_gondola INNER JOIN presentacion AS pres on' + 
  ' gp.Presentacion_id_presentacion = pres.id_presentacion INNER JOIN Gondola_Producto_Repositor' +
  ' AS gpr on gp.id_producto = gpr.id_producto WHERE gp.id_gondola = gpr.id_gondola AND gp.id_gondola = gpr.id_gondola'

  // en caso de que exista repositorId y/o sectorId en los params se concatenara al query la siguiente sentencia
  if (repositorId) 
    query += ` AND gpr.id_repositor = ${repositorId}`;
  if (sectorId) 
    query += ` AND g.id_sector = ${sectorId}`;

  query += ' ORDER BY gp.id_producto ASC'
  
  db.query(query, (err, result) => {
    if (err) {
      console.error('Error en la consulta SQL: ', err);
      res.status(500).json({ mensaje: 'Error al obtener productos filtrados' });
      return;
    }

    res.json(result);
  });
});

app.get('/api/sectores', (req, res) => {
  let sql = 'SELECT id_sector, desc_sector FROM Sector';
  db.query(sql, (err, results) => {
    if (err) {
      throw err;
    }
    res.json(results);
  });
 });

app.get('/api/repositores', (req, res) => {
  let sql = 'SELECT id_repositor, nombre FROM Repositor';
  db.query(sql, (err, results) => {
    if (err) {
      throw err;
    }
    res.json(results);
  });
 });

app.listen('3000', () => {
  console.log('Server corriendo en el puerto 3000');
});
