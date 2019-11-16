import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import toastRegistry from "./components/common/toast";
import FastClick from 'fastclick'
import VueLazyLoad from 'vue-lazyload'

var axios = require('axios')
axios.defaults.baseURL = '/api'
Vue.prototype.$axios = axios
Vue.prototype.$bus = new Vue()
Vue.config.productionTip = false
FastClick.attach(document.body)
Vue.use(VueLazyLoad)
// 这里也可以直接执行 toastRegistry()
Vue.use(toastRegistry)



new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
