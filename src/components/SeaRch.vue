<template>
  <div>
    <hea-der></hea-der>
    <div class="container">
      <div class="hig" v-loading="loading2">
        <div class="row text-center">
          <div v-if="err" style="width:100%;color:#9c9c9c;padding:10% 0;">
            <img src="/static/images/ssbd.png" width="10%">
            <p>呃......你要找的“{{this.$route.query.name}}”暂时没有人发布哦！</p>
          </div>
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
        v-if="!err"
      ></page-mode>
    </div>
    <foo-ter></foo-ter>
    <footer-bottom></footer-bottom>
  </div>
</template>

<script>
import HeaDer from "./public/HeaDer";
import PageMode from "./navClass/PageMode";
import FooTer from "./public/FooTer";
import FooterBottom from "./public/FooterBottom";
export default {
  name: "SeaRch",
  data() {
    return {
      name: "",
      total: 0,
      row: 0,
      display: 16,
      currentPage: 1,
      list: [],
      err: false,
      loading2: true
    };
  },
  mounted() {
    this.name = this.$route.query.name;
    this.getTotal();
    this.getSearch();
  },
  methods: {
    getSearch() {
      this.axios({
        method: "get",
        url: "/search",
        params: {
          name: this.name,
          row: this.row,
          display: this.display
        }
      })
        .then(res => {
          if (res.data.length == 0) {
            this.err = true;
            this.loading2 = false;
          } else {
            this.list = res.data;
            this.loading2 = false;
          }
        })
        .catch(err => {
          console.log(err);
        });
    },
    pageChange(index) {
      this.currentPage = index;
      this.row = (this.currentPage - 1) * this.display;
      this.getSearch();
    },
    getTotal() {
      this.axios({
        method: "get",
        url: "/search/total",
        params: {
          name: this.name
        }
      })
        .then(res => {
          this.total = res.data[0].total;
        })
        .catch(err => {
          console.log(err);
        });
    }
  },
  components: {
    FooTer,
    FooterBottom,
    HeaDer,
    PageMode
  }
};
</script>

<style scoped>
</style>