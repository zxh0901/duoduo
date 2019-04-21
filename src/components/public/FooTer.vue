<template>
  <div class="container-fluid foo">
    <div class="container footer">
      <div class="row">
        <div class="col">
          <img src="/static/images/aq.png" alt>
          <span>交易安全</span>
        </div>
        <div class="col">
          <img src="/static/images/gf.png" alt>
          <span>多平台认证</span>
        </div>
        <div class="col">
          <img src="/static/images/cjgl.png" alt>
          <span>管理便捷</span>
        </div>
        <div class="col">
          <img src="/static/images/kf.png" alt>
          <span>24小时客服</span>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Footer"
};
</script>

<style scoped>
.container-fluid {
  background: #ffd84d;
}
.foo{
  margin-top: 20px;
}
.footer {
  height: 120px;
  line-height: 120px;
  text-align: center;
}
.col img {
  width: 20%;
}
.col span{
  font-weight: 700;
}
</style>