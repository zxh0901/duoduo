const mysql = require('mysql')
const connection = mysql.createConnection({
  port: '3306',
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'duoduo'
})


module.exports = connection;