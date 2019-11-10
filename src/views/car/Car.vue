<template>
    <div class="cart">
        <nav-bar class="nav-bar">
            <div slot="center">购物车({{cartLength}})</div>
        </nav-bar>
        <cart-list class="cart-list"></cart-list>
        <car-bottom-bar></car-bottom-bar>
    </div>
</template>

<script>
    import NavBar from "components/common/navbar/NavBar";
    import CarBottomBar from "./childComps/CarBottomBar";
    import CartList from "./childComps/CartList";
    import {mapGetters} from 'vuex'
    export default {
        name: "Car",
        components: {
            NavBar,
            CartList,
            CarBottomBar
        },
        computed: {
            // cartLength(){
            //     return this.$store.getters.cartLength
            // }
            ...mapGetters(['cartLength'])
        }
    }
</script>

<style scoped>
    .cart {
        height: 100vh;
        position: relative;
    }
   .nav-bar {
     background-color: var(--color-tint);
     color: #fff;
     position: relative;

   }
   /*.cart-list {*/
   /*    position: absolute;*/
   /*    top: 44px;*/
   /*    bottom: 49px;*/
   /*    width: 100%;*/
   /*}*/
</style>
