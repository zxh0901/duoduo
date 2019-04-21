const users = require('./users')
const goods = require('./goods')
const express = require('express')

var app = express()
//设置跨域访问
app.all('*', function (req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "X-Requested-With");
  res.header("Access-Control-Allow-Methods", "PUT,POST,GET,DELETE,OPTIONS");
  res.header("X-Powered-By", ' 3.2.1');
  res.header("Content-Type", "application/json;charset=utf-8");
  next();
});

//用户接口
app.use(users.login);
app.use(users.login_getuser);
app.use(users.login_setuser);
app.use(users.register);
app.use(users.register_ver);
app.use(users.updateuserimg);
app.use(users.updatepwd);

//商品接口
app.use(goods.all)
app.use(goods.addgoods)
app.use(goods.goods)
app.use(goods.goods_list)
app.use(goods.goods_total)
app.use(goods.goods_navtotal)
app.use(goods.search)
app.use(goods.search_total)
app.use(goods.goods_sx)
app.use(goods.goods_sx_total)
app.use(goods.goods_sx_setstatus)
app.use(goods.goods_status)
app.use(goods.goods_status_total)
app.use(goods.update_goods)
app.use(goods.delete_goods)
app.use(goods.goods_message)
app.use(goods.add_message)
app.use(goods.goods_user_message)
app.use(goods.goods_user_message2)
app.use(goods.goods_delete_message)
app.use(goods.goods_reply_message)

app.listen(3030, function () {
  console.log("success!");
});
