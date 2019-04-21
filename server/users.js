var express = require('express');
var app = express();
var bodyParser = require('body-parser');
var md5 = require('md5');
var multer = require('multer');
var connection = require('./connectsql')
var urlencodedparser = bodyParser.urlencoded({
  extended: false
});


var upload = multer({
  storage: multer.diskStorage({
    destination: function (req, file, cd) {
      cd(null, '../static/images/users');
    },
    filename: function (req, file, cd) {
      //file.originalname上传文件的原始文件名
      var changeName = (new Date().getTime()) + '-' + file.originalname;
      cd(null, changeName);
    }
  })
})

connection.connect();



//登录验证
const login = app.post('/login', urlencodedparser, function (req, res) {
  let sql = "select * from users where name = ? and password = ?"
  let mod = [req.body.user, md5(req.body.password)];
  connection.query(sql, mod, function (err, rel) {
    if (err) {
      console.log(err.message);
      return;
    }
    res.send(JSON.stringify(rel));
  })
})

//注册验证
const register_ver = app.post('/register/ver', urlencodedparser, function (req, res) {
  let sql = "select name from users where name = ?";
  let name = req.body.name;
  connection.query(sql, name, function (err, rel) {
    if (err) {
      console.log(err.message);
      return;
    }
    res.send(JSON.stringify(rel));
  })
});

//用户注册
const register = app.post('/register', urlencodedparser, function (req, res) {
  let sql = "insert into users (name,password,phone) values (?,?,?)";
  let values = [req.body.name, md5(req.body.password), req.body.phone];
  connection.query(sql, values, function (err, rel) {
    if (err) {
      console.log(err.message);
      res.send("error");
      return;
    }
    res.send("success");
  })
});

//获取用户资料
const login_getuser = app.post('/login/getuser', urlencodedparser, function (req, res) {
  let name = req.body.name;
  let sql = "select * from users where name = ?";
  connection.query(sql, name, function (err, rel) {
    if (err) {
      console.log(err.message);
      return;
    } else {
      res.send(JSON.stringify(rel));
    }
  })
})

//用户基本资料修改
const login_setuser = app.post('/login/setuser', urlencodedparser, function (req, res) {
  let mod = [req.body.sex, req.body.phone, req.body.address, req.body.birthday, req.body.label, req.body.name];
  let sql = "update users set sex = ?, phone = ?, address = ?, birthday = ?, label = ? where name = ?";
  connection.query(sql, mod, function (err, rel) {
    if (err) {
      console.log(err.message);
      return;
    } else {
      res.send("success");
    }
  })
})

//修改用户头像
const updateuserimg = app.post('/login/updateuserimg', upload.single("img"), (req, res) => {
  let mod = [req.file.filename, req.body.name];
  let sql = "update users set img = ? where name = ?";
  connection.query(sql, mod, function (err, rel) {
    if (err) {
      console.log(err.message);
      return;
    } else {
      res.send("success");
    }
  })
})

//修改密码
const updatepwd = app.post('/login/updatepwd', urlencodedparser, (req, res) => {
  let newpwd = md5(req.body.newpwd);
  let name = req.body.name;
  let mod = [newpwd, name];
  let sql = "update users set password = ? where name = ?";
  connection.query(sql, mod, function (err, rel) {
    if (err) {
      console.log(err.message);
      return;
    }
    res.send("success");
  })
})

// app.listen(3031, function () {
//   console.log("success!");
// });

exports.login = login;
exports.login_getuser = login_getuser;
exports.login_setuser = login_setuser;
exports.register = register;
exports.register_ver = register_ver;
exports.updateuserimg = updateuserimg;
exports.updatepwd = updatepwd;
