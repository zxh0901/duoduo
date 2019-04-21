var express = require('express');
var multer = require('multer')
var connection = require('./connectsql')

var app = express();
var upload = multer({
  storage: multer.diskStorage({
    destination: function (req, file, cd) {
      cd(null, '../static/images/goods');
    },
    filename: function (req, file, cd) {
      //file.originalname上传文件的原始文件名
      var changeName = (new Date().getTime()) + '-' + file.originalname;
      cd(null, changeName);
    }
  })
})


//请求goods表总记录条数
const goods_total = app.get("/goods/total", function (req, res) {
  let sql = "select count(*) as total from goods where status = '已上架'";
  connection.query(sql, function (err, rel) {
    if (err) {
      console.log(err.message);
    } else {
      res.send(JSON.stringify(rel));
    }
  })
});

//请求不同种类商品的记录数
const goods_navtotal = app.get("/goods/navtotal", function (req, res) {
  let navclass = req.query.navclass;
  let sql = "select count(*) as total from goods where class = ? and status = '已上架'";
  connection.query(sql, navclass, function (err, rel) {
    if (err) {
      console.log(err.message);
    } else {
      res.send(JSON.stringify(rel));
    }
  })
});

//请求搜索结果的记录数
const search_total = app.get("/search/total", function (req, res) {
  let name = req.query.name;
  let sql = "select count(*) as total from goods where status = '已上架' and name like '%" + name + "%'";
  connection.query(sql, function (err, rel) {
    if (err) {
      console.log(err.message);
    } else {
      res.send(JSON.stringify(rel));
    }
  })
});

//请求相应行的数据
const all = app.get("/all", function (req, res) {
  let sql = "select *  from goods where status = '已上架' order by id desc limit ?,?";
  let row = parseInt(req.query.row);
  let display = parseInt(req.query.display);
  let a = [row, display];
  connection.query(sql, a, function (err, rel) {
    if (err) {
      console.log(err.message);
    } else {
      res.send(JSON.stringify(rel));
    }
  });
});

//请求不同种类商品的数据
const goods = app.get("/goods", function (req, res) {
  let sql = "select *  from goods where status = '已上架' and class = ? order by id desc limit ?,?";
  let navclass = req.query.navclass;
  let row = parseInt(req.query.row);
  let display = parseInt(req.query.display);
  let a = [navclass, row, display];
  connection.query(sql, a, function (err, rel) {
    if (err) {
      console.log(err.message);
    } else {
      res.send(JSON.stringify(rel));
    }
  });
});

//返回相应id的商品数据
const goods_list = app.get("/goods/list", function (req, res) {
  let a = req.query.id;
  let sql = "select * from goods where id = ?";
  connection.query(sql, a, function (err, rel) {
    if (err) {
      console.log(err.message);
    } else {
      res.send(JSON.stringify(rel));
    }
  })
});

//返回搜索结果
const search = app.get("/search", function (req, res) {
  let a = req.query.name;
  let mod = [parseInt(req.query.row), parseInt(req.query.display)]
  let sql = "select * from goods where status = '已上架' and name like '%" + a + "%' order by id desc limit ?,?";
  connection.query(sql, mod, function (err, rel) {
    if (err) {
      console.log(err.message);
    } else {
      res.send(JSON.stringify(rel));
    }
  })
})

//发布商品
const addgoods = app.post('/addgoods', upload.single("img"), (req, res) => {
  let mod = [req.body.name, req.file.filename, parseInt(req.body.price), req.body.color, req.body.address, req.body.phone, req.body.paystyle, req.body.gclass, req.body.user, req.body.desc];
  let sql = "insert into goods values (0,?,?,?,?,?,?,?,?,?,?,'已上架')";
  connection.query(sql, mod, function (err, rel) {
    if (err) {
      console.log(err.message);
      return;
    } else {
      res.send("success");
    }
  })
})

//查询用户发布商品总数
const goods_sx_total = app.get('/goods/sx/total', function (req, res) {
  let name = req.query.name;
  let sql = "select count(*) as sum from goods where user = ?";
  connection.query(sql, name, function (err, rel) {
    if (err) {
      console.log(err.message);
      return;
    }
    res.send(JSON.stringify(rel));
  })
})

//查询用户发布商品状态
const goods_sx = app.get('/goods/sx', function (req, res) {
  let sql = "select * from goods where user = ? order by id desc limit ?,?";
  let name = req.query.name;
  let row = parseInt(req.query.row);
  let display = parseInt(req.query.display);
  let mod = [name, row, display];
  connection.query(sql, mod, function (err, rel) {
    if (err) {
      console.log(err.message);
      return;
    }
    res.send(JSON.stringify(rel));
  })
})

//修改商品状态
const goods_sx_setstatus = app.get('/goods/sx/setstatus', function (req, res) {
  let goodsstatus = req.query.goodsstatus;
  let goodsid = parseInt(req.query.goodsid);
  let mod = [goodsstatus, goodsid];
  let sql = "update goods set status = ? where id = ?";
  connection.query(sql, mod, function (err, rel) {
    if (err) {
      console.log(err.message);
      return;
    }
    res.send("success");
  })
})

//查询不同状态商品的总数
const goods_status_total = app.get('/goods/status/total', function (req, res) {
  let name = req.query.name;
  let gstatus = req.query.gstatus;
  let mod = [name, gstatus];
  let sql = "select count(*) as sum from goods where user = ? and status = ?";
  connection.query(sql, mod, function (err, rel) {
    if (err) {
      console.log(err.message);
      return;
    }
    res.send(JSON.stringify(rel));
  })
})

//查询不同状态的商品
const goods_status = app.get('/goods/status', function (req, res) {
  let gstatus = req.query.gstatus;
  let name = req.query.name;
  let row = parseInt(req.query.row);
  let display = parseInt(req.query.display);
  let mod = [name, gstatus, row, display];
  let sql = "select * from goods where user = ? and status = ? order by id desc limit ?,?";
  connection.query(sql, mod, function (err, rel) {
    if (err) {
      console.log(err.message);
      return;
    }
    res.send(JSON.stringify(rel));
  })
})

//修改商品信息
const update_goods = app.post('/goods/update_goods', upload.single("img"), (req, res) => {
  let mod = [req.body.name, req.file.filename, parseInt(req.body.price), req.body.color, req.body.address, req.body.phone, req.body.paystyle, req.body.gclass, req.body.desc, parseInt(req.body.gid)];
  let sql = "update goods set name = ?,img = ?,price= ?,color = ?,address = ?,phone = ?,paystyle = ?,class = ?,gdesc = ? where id = ?";
  connection.query(sql, mod, function (err, rel) {
    if (err) {
      console.log(err.message);
      return;
    }
    res.send("success");
  })
})

//删除商品
const delete_goods = app.get('/goods/delete_goods', function (req, res) {
  let gid = req.query.gid;
  let sql = "delete from goods where id = ?";
  connection.query(sql, gid, function (err, rel) {
    if (err) {
      console.log(err.message);
      return;
    }
    res.send("success");
  })
})

//查询留言
const goods_message = app.get('/goods/message', function (req, res) {
  let gid = req.query.gid;
  let sql = "select * from messages where gid = ? order by id desc";
  connection.query(sql, gid, function (err, rel) {
    if (err) {
      console.log(err.message);
      return;
    }
    res.send(JSON.stringify(rel));
  })
})

//发表留言
const add_message = app.get('/goods/addmessage', function (req, res) {
  let mod = [req.query.user, req.query.gid, req.query.message, req.query.mdate, req.query.userimg, req.query.user2,req.query.userimg2];
  let sql = "insert into messages (user,gid,message,mdate,userimg,user2,userimg2) values(?,?,?,?,?,?,?)";
  connection.query(sql, mod, function (err, rel) {
    if (err) {
      console.log(err.message);
      return;
    }
    res.send("success");
  })
})

//查询不同用户留言
const goods_user_message = app.get('/goods/usermessage', function (req, res) {
  let user = req.query.user;
  let sql = "select * from messages where user = ? order by id desc";
  connection.query(sql, user, function (err, rel) {
    if (err) {
      console.log(err.message);
      return;
    }
    res.send(JSON.stringify(rel));
  })
})

//查询不同用户回复的留言
const goods_user_message2 = app.get('/goods/usermessage2', function (req, res) {
  let user2 = req.query.user2;
  let sql = "select * from messages where user2 = ? order by id desc";
  connection.query(sql, user2, function (err, rel) {
    if (err) {
      console.log(err.message);
      return;
    }
    res.send(JSON.stringify(rel));
  })
})

//删除留言
const goods_delete_message = app.get('/goods/deletemessage', function (req, res) {
  let id = req.query.id;
  let sql = "delete from messages where id = ?"
  connection.query(sql, id, function (err, rel) {
    if (err) {
      console.log(err.message);
      return;
    }
    res.send("success");
  })
})

//留言回复
const goods_reply_message = app.get('/goods/replymessage', function (req, res) {
  let mod = [req.query.mreply, req.query.id];
  let sql = "update messages set mreply = ?, mshow = 1 where id = ?";
  connection.query(sql, mod, function (err, rel) {
    if (err) {
      console.log(err.message);
      return;
    }
    res.send("success");
  })
})

// app.listen(3030, function () {
//   console.log("success!");
// });

exports.addgoods = addgoods;
exports.search = search;
exports.search_total = search_total;
exports.goods = goods;
exports.goods_list = goods_list;
exports.goods_navtotal = goods_navtotal;
exports.goods_total = goods_total;
exports.all = all;
exports.goods_sx = goods_sx;
exports.goods_sx_total = goods_sx_total;
exports.goods_sx_setstatus = goods_sx_setstatus;
exports.goods_status = goods_status;
exports.goods_status_total = goods_status_total;
exports.update_goods = update_goods;
exports.delete_goods = delete_goods;
exports.goods_message = goods_message;
exports.add_message = add_message;
exports.goods_user_message = goods_user_message;
exports.goods_user_message2 = goods_user_message2;
exports.goods_delete_message = goods_delete_message;
exports.goods_reply_message = goods_reply_message;
