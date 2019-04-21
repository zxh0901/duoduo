<template>
  <div class="container footer-bottom">
    <div class="row">
      <div class="col">合作伙伴</div>
      <div class="col">营销中心</div>
      <div class="col">联系客服</div>
      <div class="col">开放平台</div>
      <div class="col">人才招聘</div>
      <div class="col">联系我们</div>
      <div class="col">隐私权政策</div>
      <div class="col">关于多多</div>
      <div class="col">法律声明</div>
      <div class="col">知识产权</div>
    </div>
    <div class="row">
      <div class="col" style="color:#9c9c9c;">© 2019 多多二手 版权所有</div>
    </div>
  </div>
</template>

<script>
export default {
  name: "FooterBottom"
};
</script>

<style scoped>
.footer-bottom {
  font-size: 14px;
  text-align: center;
  margin-bottom: 40px;
  margin-top: 40px;
  padding-top: 20px;
  border-top: 1px solid #cccccc;
}
.footer-bottom .col {
  cursor: pointer;
  margin-top: 10px;
  color: #6c6c6c;
}
</style>