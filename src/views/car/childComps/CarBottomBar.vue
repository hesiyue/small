<template>
    <div class="car-barttom-bar">
         <div class="select-all" >
             <check-button :is-checked="isSelectAll" @click.native="checkAll"></check-button>
             <span>全选</span>
         </div>

        <div class="price">
             合计: ￥{{totalPrice}}
        </div>

        <div class="calculate" @click="toCalculate">
            去结算({{calculate}})
        </div>
    </div>
</template>

<script>
    import CheckButton from "components/content/checkButton/CheckButton";
    import {getCartList, toCalculate} from "../../../network/cart";

    export default {
        name: "CarBottomBar",
        components: {
            CheckButton
        },
        computed: {
           totalPrice(){
               const cartList = this.$store.getters.cartList;
               return cartList.filter(item => {
                   return item.checked
               }).reduce((preValue, item) => {
                   return preValue + item.count * item.price
               }, 0).toFixed(2)
           },
           calculate(){
               const cartList = this.$store.getters.cartList;

               return cartList.filter(item=>item.checked).length
           },
           isSelectAll(){
               const cartList = this.$store.getters.cartList;
               if(cartList.length===0)
                   return false
               return cartList.every(item=>item.checked)
           },
        },
        methods: {
            checkAll(){
                const cartList = this.$store.getters.cartList
                if(this.isSelectAll){
                    cartList.forEach(item=>item.checked=false)
                }else
                    cartList.forEach(item=>item.checked=true)
            },
            toCalculate(){
                const cartList = this.$store.getters.cartList;
                cartList.forEach(item=>{
                    if(item.checked===true){
                       toCalculate(this.$store.state.Authorization,item.id).then(res=>{
                            if(res.data.code===200){
                                cartList.splice(cartList.indexOf(item),1)
                                this.$store.commit('changeBalance',res.data.userEntity.balance)
                            }else if(res.data.code===201){
                                this.$toast('库存不足')
                            }else {
                                this.$toast('余额不足')
                            }
                       })
                    }
                })
            }
        }
    }
</script>

<style scoped>
  .car-barttom-bar {
      position: absolute;
      display: flex;
      left: 0;
      right: 0;
      z-index: 9;
      height: 40px;
      line-height: 40px;
      bottom: 50px;
      background-color: #eee;
      overflow: hidden;
      font-size: 14px;
  }
   .select-all {
      align-items: center;
      display: flex;
      position: absolute;
      line-height: 0;
      left: 12px;
      top: 13px;
  }


  .price {
      margin-left: 130px;
      flex: 1;
  }

  .calculate {
      width: 90px;
      background: red;
      color: #fff;
      text-align: center;
      float: right;

  }
</style>
