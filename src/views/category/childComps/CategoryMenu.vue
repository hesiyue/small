<template>
    <scroll class="tab-menu">
            <div class="menu-list">
                <div class="menu-list-item"
                     v-for="(item,index) in categories" :key="index"
                     :class="{active:index===currentIndex}"
                     @click="itemClick(index)">{{item}}</div>
            </div>
    </scroll>
</template>

<script>
    import Scroll from "components/common/scroll/Scroll";
    export default {
        name: "CategoryMenu",
        components: {
            Scroll
        },
        data(){
            return {
               categories:[
                   '上衣','裤子','裙子','套装','内衣','女鞋','护肤','美妆','运动','配饰','男友','家居','百货','宠物','男装'
               ],
               currentIndex: 0
            }
        },
        methods: {
            itemClick(index){
                this.currentIndex = index
                this.$emit('showGoods',index)
            }
        }
    }
</script>

<style scoped>
  .tab-menu {
      background-color: #f6f6f6;
      width: 100px;
      box-sizing: border-box;
      position: absolute;
      top: 44px;
      bottom: 49px;
      /*z-index: 9;*/
      overflow: hidden;
  }
  .menu-list-item {
      height: 45px;
      text-align: center;
      line-height: 45px;
      font-size: 15px;
  }
  .active {
      font-weight: 700;
      color: var(--color-high-text);
      background-color: #fff;
      border-left: 3px solid var(--color-high-text);
  }
</style>
