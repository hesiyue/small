<template>
   <div class="tab-control">
       <div v-for="(item,index) in titles" class="tab-control-item"
       :class="{active: index===currentIndex}"
       @click="itemClick(index)">
           <span>{{item}}</span>
       </div>
   </div>
</template>

<script>
    export default {
        name: "TabControl",
        data(){
            return {
                currentIndex: 0,
            }
        },
        methods: {
            itemClick(index){
                this.currentIndex = index
                this.$emit('tabClick',index)
            }
        },
        props: {
            titles: {
                type: Array,
                default(){
                    return []
                }
            }
        }
    }
</script>

<style scoped>
  .tab-control {
      /*flex水平布局*/
      display: flex;
      text-align: center;
      font-size: 15px;
      height: 40px;
      line-height: 40px;
      z-index: 9;
  }
  .tab-control-item {
      flex: 1;
  }
  .tab-control-item span {
      padding: 5px;
  }
  .active span{
      color: var(--color-high-text);
      /*border-bottom是设置下划线的宽度，颜色*/
      border-bottom: 3px solid var(--color-tint);
  }
</style>
