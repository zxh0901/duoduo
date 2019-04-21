<template>
  <div>
    <head-main></head-main>
    <head-top></head-top>
    <head-nav></head-nav>
    <router-view/>
    <foo-Ter></foo-Ter>
    <footer-bottom></footer-bottom>
  </div>
</template>

<script>
import HeadNav from "./public/HeadNav";
import HeadTop from "./public/HeadTop";
import HeadMain from "./public/HeadMain";
import FooTer from './public/FooTer'
import FooterBottom from './public/FooterBottom'
export default {
  components: {
    HeadNav,
    HeadTop,
    HeadMain,
    FooTer,
    FooterBottom
  }
};
</script>
