<template>
      <scroll class="content" ref="scroll">
          <div>
              <cart-list-item v-for="(item,index) in cartList" :cart="item" :key="index" ></cart-list-item>
          </div>
      </scroll>
</template>

<script>
    import {mapGetters} from 'vuex'
    import Scroll from "components/common/scroll/Scroll";
    import CartListItem from "./CartListItem";

    export default {
        name: "CartList",
        components: {
            Scroll,
            CartListItem
        },
        computed: {
            ...mapGetters(["cartList"])
        },
        activated() {
            this.$refs.scroll.finishPullUp()
            this.$refs.scroll.refresh()
        }
    }
</script>

<style scoped>

 .content {
     position: absolute;
     top: 44px;
     bottom: 89px;
     left: 0;
     right: 0;
     overflow: hidden;
 }
</style>
