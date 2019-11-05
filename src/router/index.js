import Vue from 'vue'
import VueRouter from 'vue-router'

const Home = ()=> import('../views/home/Home')
const Car = ()=> import('../views/car/Car')
const Category = ()=> import('../views/category/Category')
const Info = ()=> import('../views/info/Info')

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
    component: Info
  },
  {
    path: '/car',
    component: Car
  },
  {
    path: '/category',
    component: Category
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
