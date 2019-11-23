import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

const store = new Vuex.Store({
  state: {
    cartList: [],
    Authorization: '',
    userInfo: {
      type:Object,
      default(){}
    }
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
    addToCounter(state,payload){
      payload.goodsDetailEntity.count = payload.num

    },
    addToCart(state,payload){
      payload.count = 1
      state.cartList.push(payload)
    },
    changeLogin(state,tokens){
      state.Authorization = tokens;
      // localStorage.setItem('Authorization',JSON.stringify(tokens))
    },
    delToken(){
      this.state.Authorization = '';
      // localStorage.setItem('Authorization',JSON.stringify(this.state.Authorization))
    },
    getUserInfo(state,payloda){
      this.state.userInfo = payloda
    },
    changeBalance(payload){
      this.state.userInfo.balance = payload
    }
  },
  // 异步操作和判断逻辑尽可能都放在action中
  actions: {

    addCart(context,payload){
      return new Promise((resolve, reject) => {
        let oldProduct = context.state.cartList.find(item=>item.id===payload.id)
        if(oldProduct){
          context.commit('addCounter',oldProduct)
        }else {
        payload.checked = false
        context.commit('addToCart',payload)
      }
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
    }
  },
  modules: {
  }
})

export default store
