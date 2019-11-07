<template>
    <div id="detail-nav-bar">
        <nav-bar class="nav-bar">
            <div slot="left" @click="backClick"><img src="~assets/img/common/back.svg"></div>
            <div slot="center" class="center">
                <div v-for="(item,index) in titles" class="title"
                     @click="itemClick(index)"
                :class="{active:index===currentIndex}">
                    <span>{{item}}</span>
                </div>
            </div>
        </nav-bar>
    </div>
</template>

<script>
    import NavBar from "components/common/navbar/NavBar";
    export default {
        name: "DetailNavBar",
        components:{
            NavBar
        },
        data(){
            return{
                titles:['商品','参数','评论','推荐'],
                currentIndex: 0
            }
        },
        methods: {
            itemClick(index){
               this.currentIndex = index
            },
            backClick(){
                this.$router.go(-1)
            }
        }
    }
</script>

<style scoped>
    #detail-nav-bar{

    }
    .nav-bar img{
       margin-top: 12px;
    }
    .center {
        display: flex;
        background-color: #ffffff;
        font-size: 13px;
        text-align: center;
    }
    .title {
        flex: 1;
    }
    .active span {
        color: var(--color-high-text);
        padding: 3px;
        /*border-bottom是设置下划线的宽度，颜色*/
        border-bottom: 3px solid var(--color-tint);
    }
</style>
