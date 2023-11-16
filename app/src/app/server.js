// Servidor Backend en Express.js
// Siempre que se actulice el package-lock.json y package.json
// ejecutar npm install
// Para correr el servidor ejecutar >node server.js

let express = require('express');
let mysql = require('mysql');
let app = express();
// Se agrega la libreria Cors dado que tiraba errores al hacer los requests desde la app
// de Angular
const cors = require('cors');
app.use(cors());

let db = mysql.createConnection({
  host: 'localhost',
  /* user: 'group9', */
  user: 'tpuser', // importante crear el usuario y dar privilegios para acceder a mydb
  password: 'alfrajuceden', // y colocar esta password
  database: 'mydb'
});

db.connect((err) => {
  if (err) {
    throw err;
  }
  console.log('Conectado al Database');
});

app.get('/api/productos', (req, res) => {
  let sql = 'SELECT gp.id_producto, p.nombre, g.nombre AS nombreGondola, pres.desc_presentacion FROM Gondola_Producto AS gp INNER JOIN producto AS p on gp.id_producto = p.id_producto INNER JOIN gondola AS g on gp.id_gondola = g.id_gondola INNER JOIN presentacion AS pres on gp.Presentacion_id_presentacion = pres.id_presentacion';
  db.query(sql, (err, results) => {
    if (err) {
      throw err;
    }
    res.json(results);
  });
});

app.get('/api/sectores', (req, res) => {
  let sql = 'SELECT * FROM Sector';
  db.query(sql, (err, results) => {
    if (err) {
      throw err;
    }
    res.json(results);
  });
});

app.get('/api/repositores', (req, res) => {
  let sql = 'SELECT * FROM Repositor';
  db.query(sql, (err, results) => {
    if (err) {
      throw err;
    }
    res.json(results);
  });
});

app.get('/api/repositores/:id', (req, res) => {
  const idRepositor = req.params.id;
  const query = 'SELECT * FROM Repositor WHERE id_repositor = ?';

  db.query(query, [idRepositor], (err, results) => {
    if (err) {
      throw err;
    }
    res.json(results);
  });
});


app.listen('3000', () => {
  console.log('Server corriendo en el puerto 3000');
});
