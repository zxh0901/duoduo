// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import './assets/css/bootstrap4.min.css'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import axios from 'axios'
import VueAxios from 'vue-axios'
import qs from 'qs'
import Vuecookies from 'vue-cookies'

Vue.use(VueAxios, axios)
Vue.prototype.qs = qs
Vue.config.productionTip = false
Vue.use(ElementUI)
Vue.use(Vuecookies)

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: {
    App
  },
  template: '<App/>'
})
