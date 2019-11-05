<template>
    <div id="tab-bar-item" @click="itemClick">
       <div v-show="!isActive" class="tab-icon"><slot name="s_icon"></slot></div>
       <div v-show="isActive" class="tab-active-icon"><slot name="s_active_icon"></slot></div>
       <div class="tab-news" :style="activeStyle"><slot name="s_news"></slot></div>
    </div>
</template>

<script>
    export default {
        name: "TabBarItem",
        props: {
          link: {
              type: String,
              required: true
          }
        },
        data(){
            return {

            }
        },
        methods: {
            itemClick(){
                this.$router.replace(this.link)
            }
        },
        computed: {
          isActive(){
              return this.$route.path.indexOf(this.link) !== -1
          },
          activeStyle(){
             return this.isActive ?{'color':'red'}:{}
          }
        }
    }
</script>

<style scoped>
#tab-bar-item {
    /*flex为1表示占据剩下的所有空间*/
    flex: 1;
}
    .tab-icon img, .tab-active-icon img {
        width: 24px;
        height: 24px;
        margin-top: 5px;
        vertical-align: middle;
    }
    .tab-news {
       font-size: 12px;
       margin-top: 3px;
       color: #333;

    }
</style>
