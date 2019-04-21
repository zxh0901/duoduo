<template>
  <div class="container-fluid htop">
    <div class="container text-center head">
      <div class="row">
        <div class="col">
          <img src="/static/images/logo.png">
        </div>
        <div class="col">
            <router-link to="/">首页</router-link>
        </div>
        <div class="col">
            <a href="javascript:void(0)">手机二手</a>
        </div>
        <div class="col">
            <a href="javascript:void(0)">二手车</a>
        </div>
        <div class="col">
            <a href="javascript:void(0)">降降降</a>
        </div>
        <div class="col">
            <a href="javascript:void(0)">发布闲置</a>
        </div>
        <div class="col">
            <a href="javascript:void(0)">我的闲置</a>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.container-fluid {
  background: #ffd84d;
}
.htop{
    margin-bottom:40px;
}
.head {
  height: 90px;
  line-height: 90px;
}
.head .row{
    height: 100%;
}
.head>.row>.col>img{
    width: 80%;
}
.head>.row>.col>a{
    color: black;
}
.head>.row>.col>a:hover{
    text-decoration: none;
    color: #ffffff;
}
</style>
