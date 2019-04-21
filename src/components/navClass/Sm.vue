<template>
  <div class="container">
    <div class="hig" v-loading="loading2">
      <div class="row text-center">
        <div v-for="item of list" :key="item.id" class="col-3 card">
          <router-link :to="'/glist?id='+item.id+'&gclass='+item.class">
            <img :src="'/static/images/goods/'+item.img" class="card-img-top" alt="加载失败">
            <div class="card-body">
              <h4 class="card-title">{{item.name}}</h4>
              <p class="card-text">￥{{item.price}}</p>
            </div>
          </router-link>
        </div>
      </div>
    </div>
    <page-mode
      @pageChange="pageChange"
      :total="total"
      :display="display"
      :currentPage="currentPage"
    ></page-mode>
  </div>
</template>

<script>
import PageMode from "./PageMode";
export default {
  name: "Sm",
  data() {
    return {
      total: 0,
      row: 0,
      display: 16,
      currentPage: 1,
      list: [],
      loading2: true
    };
  },
  mounted() {
    this.getTotal();
    this.goods();
  },
  methods: {
    goods() {
      this.axios({
        method: "get",
        url: "/goods",
        params: { navclass: "sm", row: this.row, display: this.display }
      })
        .then(res => {
          this.list = res.data;
          this.loading2 = false;
        })
        .catch(err => {
          console.log(err);
        });
    },
    getTotal() {
      this.axios({
        method: "get",
        url: "/goods/navtotal",
        params: {
          navclass: "sm"
        }
      })
        .then(res => {
          this.total = res.data[0].total;
        })
        .catch(err => {
          console.log(err);
        });
    },
    pageChange(index) {
      this.currentPage = index;
      this.row = (this.currentPage - 1) * this.display;
      this.goods();
    }
  },
  components: {
    PageMode
  }
};
</script>

<style scoped>
</style>