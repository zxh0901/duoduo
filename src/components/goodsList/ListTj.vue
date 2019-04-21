<template>
  <div class="list-model">
    <span style="font-size:18px;font-weight:600;">相关推荐</span>
    <router-link
      :to="'/index/'+this.$route.query.gclass"
      style="color:#28a745;float:right;display:inline-block"
    >更多</router-link>
    <div class="row">
      <div class="col-6" v-for="item of tj" :key="item.id">
        <router-link :to="'/glist?id='+item.id+'&gclass='+item.class">
          <img :src="'/static/images/goods/'+item.img" width="50%" height="117px">
          <span class="tj-name">{{item.name}}</span>
          <span class="tj-price">￥{{item.price}}</span>
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      row: 0,
      display: 6,
      tj: []
    };
  },
  mounted() {
    this.getGoods();
  },
  methods: {
    getGoods() {
      this.axios({
        method: "get",
        url: "/goods",
        params: {
          row: this.row,
          display: this.display,
          navclass: this.$route.query.gclass
        }
      })
        .then(res => {
          this.tj = res.data;
        })
        .catch(err => {
          console.log(err);
        });
    }
  }
};
</script>

<style scoped>
.list-model {
  padding: 15px;
  border: 1px solid #c0c0c0;
}
.list-model > .row > .col-6 {
  margin-top: 30px;
}
.list-model a:hover {
  color: #28a745;
}
.tj-name {
  display: block;
  float: right;
  font-size: 13px;
  width: 45%;
  height: 50%;
  overflow: hidden;
}
.tj-price {
  display: block;
  color: red;
  font-size: 18px;
  float: right;
  margin-top: -40px;
  font-weight: 600;
}
</style>