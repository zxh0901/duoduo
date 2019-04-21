<template>
  <div class="container">
    <div class="row">
      <div class="col-7 list-bottom">
        <el-tabs v-model="activeName">
          <el-tab-pane label="宝贝介绍" name="first">
            <p class="list_bottom_p">
              如遇到以下情况可能是诈骗行为：
              <span>1.宝贝价格异常低；2.卖家要求QQ沟通；3.卖家要求直接汇款。</span>
            </p>
            <h4 class="list_bottom_h4">宝贝介绍</h4>
            <p style="font-size:15px;">{{list.gdesc}}</p>
          </el-tab-pane>
          <el-tab-pane label="留言" name="second">
            <p class="list_bottom_p">
              如遇到以下情况可能是诈骗行为：
              <span>1.宝贝价格异常低；2.卖家要求QQ沟通；3.卖家要求直接汇款。</span>
            </p>
            <h4 class="list_bottom_h4">留言</h4>
            <list-message :id="this.$route.query.id" :user="list"></list-message>
          </el-tab-pane>
          <el-tab-pane label="安全保障" name="third">
            <p class="list_bottom_p">
              如遇到以下情况可能是诈骗行为：
              <span>1.宝贝价格异常低；2.卖家要求QQ沟通；3.卖家要求直接汇款。</span>
            </p>
            <h4 class="list_bottom_h4">安全保障</h4>
            <div class="bottom_img">
              <div class="jyimg">
                <img src="/static/images/dbjy.png">
                <strong>担保交易</strong>
                <span>由多多先行保管，验货完成后在付款到卖家账户。</span>
              </div>
              <div class="smimg">
                <img src="/static/images/smrz.png">
                <strong>实名认证</strong>
                <span>由多多核实身份信息和银行账户，真实可靠。</span>
              </div>
              <div class="smimg">
                <img src="/static/images/zytd.png">
                <strong>专业团队</strong>
                <span>发现可疑卖家或商品，发起举报，由安全部门专员介入处理交易出现纠纷。</span>
              </div>
            </div>
          </el-tab-pane>
        </el-tabs>
      </div>
      <div class="col-5">
        <list-tj></list-tj>
      </div>
    </div>
  </div>
</template>

<script>
import ListMessage from "./ListMessage";
import ListTj from "./ListTj";
export default {
  data() {
    return {
      activeName: "first"
    };
  },
  props: {
    list: {
      default: []
    }
  },
  methods: {},
  components: {
    ListTj,
    ListMessage
  }
};
</script>

<style>
.list_bottom_p {
  font-size: 12px;
}
.list_bottom_p span {
  color: #28a745;
}
.list_bottom_h4 {
  font-size: 18px;
  font-weight: 700;
  margin: 20px 0;
}
.bottom_img {
  margin-top: 40px;
  border-top: 1px solid #c0c0c0;
  font-family: "微软雅黑";
}
.bottom_img strong {
  font-weight: 700;
  font-size: 16px;
}
.bottom_img span {
  font-size: 13px;
}
.jyimg,
.smimg {
  border-bottom: 1px solid #c0c0c0;
}
.jyimg,
.smimg {
  padding: 10px;
}
.jyimg img,
.smimg img {
  width: 10%;
}
.el-tabs__active-bar {
  background-color: #28a745 !important;
}
.is-active {
  color: #28a745 !important;
}
.el-tabs__item {
  font-size: 18px;
  font-weight: 700;
}
.el-tabs__item:hover {
  color: #28a745 !important;
}
</style>