import Vue from 'vue'
import Vuex from 'vuex'
import fa from "element-ui/src/locale/lang/fa";
import {getCartList} from "../network/cart";

Vue.use(Vuex)

const store = new Vuex.Store({
  state: {
    cartList: [],
    Authorization: '',
    userInfo: {
      type:Object,
      default(){}
    },
    goodsInfoState: false
  },
  mutations: {
    // mutations中的每一个方法尽可能只完成单一事件
    // addCart(state,payload){
    //   let oldProduct = state.cartList.find(item=>item.id===payload.id)
    //
    //   if(oldProduct){
    //     oldProduct.count +=1
    //   }else {
    //     payload.count = 1
    //     state.cartList.push(payload)
    //   }
    // }

    addCounter(state,payload){
      // payload.count++
      payload.goodsDetailEntity.count = payload.num
    },
    addToCounter(state,payload){
      payload.goodsDetailEntity.count = payload.num

    },
    addToCart(state,payload){
      // if(payload.count ===1)
      //   state.cartList.push(payload)
      // payload.count = 1
      payload.goodsDetailEntity.count = payload.num
      // if(state.cartList.find(item=>item.id===payload.goodsDetailEntity.id))
        for(var i=0;i<state.cartList.length;i++){
          if(state.cartList[i].id===payload.goodsDetailEntity.id){
            state.cartList.splice(i,1)
          }
        }
      state.cartList.push(payload.goodsDetailEntity)
    },
    changeLogin(state,tokens){
      state.Authorization = tokens;
      // localStorage.setItem('Authorization',JSON.stringify(tokens))
    },
    delToken(){
      this.state.Authorization = '';
      this.state.cartList = []
      // localStorage.setItem('Authorization',JSON.stringify(this.state.Authorization))
    },
    getUserInfo(state,paylod){
      this.state.userInfo = paylod
    },
    changeBalance(payload){
      this.state.userInfo.balance = payload
    },
    changeGoodsInfoState(state){
      this.state.goodsInfoState = !this.state.goodsInfoState
    }

  },
  // 异步操作和判断逻辑尽可能都放在action中
  actions: {

    addCart(context,payload){
      return new Promise((resolve, reject) => {
      //   let oldProduct = context.state.cartList.find(item=>item.id===payload.goodsDetailEntity.id)
      //   if(oldProduct){
      //     context.commit('addCounter',payload)
      //   }else {
      //   payload.checked = false
      //   context.commit('addToCart',payload.goodsDetailEntity)
      // }
      //   context.commit('addCounter',payload)
        context.commit('addToCart',payload)
        resolve('添加购物车成功')
      })
    },



  },
  getters: {
    cartLength(state){
      return state.cartList.length
    },
    cartList(state){
        return state.cartList
    },
    userInfo(state){
      return state.userInfo
    },
    getBalance(state){
      return parseFloat(state.userInfo.balance).toFixed(2)
    },
    getAuthorization(state){
      return state.Authorization
    },
    getGoodsInfoState(state){
      return state.goodsInfoState
    }
  },
  modules: {
  }
})

export default store
