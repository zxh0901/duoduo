<template>
  <div>
    <hea-der></hea-der>
    <list-top :list="list"></list-top>
    <list-main :id="this.$route.query.id" @getList="getList"></list-main>
    <list-bottom :list="list"></list-bottom>
    <foo-ter></foo-ter>
    <footer-bottom></footer-bottom>
  </div>
</template>

<script>
import ListTop from "./ListTop";
import ListMain from "./ListMain";
import ListBottom from "./ListBottom";
import HeaDer from "../public/HeaDer";
import FooTer from "../public/FooTer";
import FooterBottom from "../public/FooterBottom";
export default {
  name: "GoodsList",
  data() {
    return {
      list: []
    };
  },
  methods: {
    getList(v) {
      this.list = v;
    }
  },
  components: {
    FooTer,
    FooterBottom,
    HeaDer,
    ListTop,
    ListMain,
    ListBottom
  }
};
</script>

