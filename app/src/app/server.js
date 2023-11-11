let express = require('express');
let mysql = require('mysql');
let app = express();

let db = mysql.createConnection({
  host: 'localhost',
  user: 'group9',
  password: 'alfrajuceden',
  database: 'mydb'
});

db.connect((err) => {
  if (err) {
    throw err;
  }
  console.log('Conectado al Database');
});

app.get('/api/productos', (req, res) => {
  let sql = 'SELECT * FROM Producto';
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

app.listen('3000', () => {
  console.log('Server corriendo en el puerto 3000');
});