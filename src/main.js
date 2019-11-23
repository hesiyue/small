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


axios.interceptors.request.use(
    config =>{
        if(localStorage.getItem('Authorization')){
            config.headers.Authorization = localStorage.getItem('Authorization');
        }
        return config;
    },
    error => {
        return Promise.reject(error);
    }
)

axios.interceptors.response.use(
    response => {
        if(response.data.code===401){
            localStorage.setItem('Authorization',null);
        }
      return response
    },
    error => {  //默认除了2XX之外都为错误
         if(error.response){
           switch(error.response.status){
                case 401:
                     this.$store.commit('delToken');
                    router.replace({ //跳转到登录页面
                        path: '/login',
                        query: { redirect: router.currentRoute.fullPath } // 将跳转的路由path作为参数，登录成功后跳转到该路由
                     });
             }
         }
        return Promise.reject(error.response);
    }
);




new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
