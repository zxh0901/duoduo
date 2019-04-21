<template>
  <div class="container list_main">
    <div class="row">
      <div class="col-7">
        <div v-loading="loading" class="card text-center">
          <img :src="'/static/images/goods/'+list.img" class="card-img-top">
        </div>
      </div>
      <div class="col-5">
        <div class="title">
          <h1>{{list.name}}</h1>
          <p>
            转&nbsp;卖&nbsp;价：
            <strong>￥{{list.price}}</strong>
          </p>
          <p>
            原&nbsp;&nbsp;&nbsp;价：
            <span>￥{{yuanjia}}</span>
          </p>
        </div>
        <div class="conent">
          <p>成&nbsp;&nbsp;&nbsp;色：{{list.color}}</p>
          <p>所&nbsp;在&nbsp;地：{{list.address}}</p>
          <p>联系方式：{{list.phone}}</p>
          <p id="p1">
            交易方式：
            <span
              v-for="(item,index) of paystyle"
              :class="item.checked&&'on'"
              :key="item.id"
              @click="on(index)"
            >{{item.value}}</span>
          </p>
        </div>
        <div>
          <button class="btn btn-success" style="width:40%;">立即购买</button>
        </div>
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
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      list: [],
      paystyle: [],
      loading: true
    };
  },
  props: {
    id: {
      default: 1
    }
  },
  mounted() {
    this.getGoods();
  },
  methods: {
    getGoods() {
      this.axios({
        method: "get",
        url: "/goods/list",
        params: {
          id: this.id
        }
      })
        .then(res => {
          this.list = res.data[0];
          this.paystyle = res.data[0].paystyle.split(",").map(item => {
            return {
              value: item,
              checked: false
            };
          });
          this.loading = false;
          this.$emit("getList", this.list);
        })
        .catch(err => {
          console.log(err);
        });
    },
    on(v) {
      this.paystyle[v].checked = this.paystyle[v].checked ? false : true;
    }
  },
  computed: {
    yuanjia() {
      return Math.ceil(this.list.price / 0.8);
    }
  },
  watch: {
    id(n, o) {
      this.getGoods();
    }
  }
};
</script>

<style scoped>
.list_main {
  margin: 30px auto;
  font-family: "宋体";
}
.card {
  background: linear-gradient(45deg, #ffffff 50%, #f0f0f0 0);
  background-size: 3px 3px;
}
.card img {
  max-width: 70%;
  height: 565px;
  margin: 0 auto;
}
.title {
  border-bottom: 1px #c0c0c0 solid;
  padding-bottom: 10px;
}
.title h1 {
  font-size: 24px;
  font-weight: 700;
  font-family: "微软雅黑";
}
.title strong {
  color: red;
  font-size: 26px;
  font-family: "微软雅黑";
}
.title span {
  font-family: "微软雅黑";
}
.conent {
  margin-top: 20px;
}
.conent p span {
  display: inline-block;
  padding: 5px;
  border: 1px #c0c0c0 solid;
  margin-right: 5px;
  cursor: pointer;
  user-select: none;
  border-radius: 3px;
  font-size: 14px;
}
.conent span {
  font-size: 12px !important;
}
.on {
  border: 1px #28a745 solid !important;
  color: #ffffff;
  background: #28a745;
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
</style>