import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    cartList: []
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
      payload.count++
    },
    addToCart(state,payload){
      payload.count = 1
      state.cartList.push(payload)
    }
  },
  // 异步操作和判断逻辑尽可能都放在action中
  actions: {

    addCart(context,payload){
      return new Promise(((resolve, reject) => {
        // let oldProduct = context.state.cartList.find(item=>item.id===payload.id)
        //
        // if(oldProduct){
        //   context.commit('addCounter',oldProduct)
        // }else {
        payload.checked = false
        context.commit('addToCart',payload)
        resolve('添加了新的商品')
      }))
      }

    // }

  },
  getters: {
    cartLength(state){
      return state.cartList.length
    },
    cartList(state){
        return state.cartList
    }
  },
  modules: {
  }
})
