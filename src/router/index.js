import Vue from 'vue'
import VueRouter from 'vue-router'
import store from "../store";

const Home = ()=> import('../views/home/Home')
const Car = ()=> import('../views/car/Car')
const Category = ()=> import('../views/category/Category')
const Info = ()=> import('../views/info/Info')
const Detail = ()=> import('../views/detail/Detail')
const Login = ()=> import('../views/info/Info')
const Profile = ()=> import('../views/info/Profile')
const UserLogin = ()=> import('../views/login/UserLogin')

Vue.use(VueRouter)


const routes = [
  {
    path: '/',
    redirect: '/home'

  },
  {
    path: '/home',
    component: Home
  },
  {
    path: '/info',
    component: Profile
  },
  {
    path: '/car',
    component: Car,
    meta: {
      requiresAuth: true
    }
  },
  {
    path: '/category',
    component: Category
  },
  {
    path: '/detail/:id',
    component: Detail
  },
  {
    path: '/login',
    component:UserLogin
  }
]



const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

// router.beforeEach((to,from,next)=>{
//   if(to.path==='/login'){
//     next();
//   }else {
//     let token = localStorage.getItem('Authorization');
//     if(token ==='null' || token===''||token===null){
//       next('/login');
//     }else {
//       next();
//     }
//   }
// })

    router.beforeEach((to,from,next)=>{
      if(to.matched.some(m=>m.meta.requiresAuth)){
        if(store.state.Authorization!= ''){
          next();
        }else if(to.path != '/login'){
          let token = store.state.Authorization;
          if(token === 'null' || token === '' || token === undefined){
            next('/login');
          }
        }else {
          next();
        }
      }else {
        next();
      }
    })





export default router
