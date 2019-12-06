<template>
    <div class="home">
       <nav-bar class="nav-bar"><div slot="center">
           <input type="text" placeholder="搜索框" v-model="searchMessage" class="searchBox">
           <input type="button" value="搜索" @click="getGoodsMessage" class="btn_Search">
       </div></nav-bar>
        <tab-control :titles="Text" ref="tabControl2" @tabClick="changeGoods" class="tab-control" v-show="isTabFixed"></tab-control>
<!--        监听组件的原生事件要用.native-->
       <back-top @click.native="backToTop" v-show="isShow"></back-top>
        <scroll class="content" ref="scroll"
                :probe-type="3"
                @scrollBack="showBackTop"
                :pull-up-load="true"
                @pullingUp="loadMore">
            <home-swiper @swiperImgLoad="swiperImgLoad"></home-swiper>
            <recommand-view></recommand-view>
            <tab-control :titles="Text" ref="tabControl" @tabClick="changeGoods"></tab-control>
            <goods-list :goods="showGoods"></goods-list>
        </scroll>
    </div>
</template>

<script>

    import TabBar from "components/common/tabbar/TabBar";
    import NavBar from "components/common/navbar/NavBar";
    import TabBarItem from "components/common/tabbar/TabBarItem";
    import RecommandView from "./childComps/RecommandView";
    import HomeSwiper from "./childComps/HomeSwiper";
    import TabControl from "components/common/tabControl/TabControl";
    import GoodsList from "components/content/goods/GoodsList";
    import Scroll from "components/common/scroll/Scroll";
    import {backTopMixin, itemListenerMixin} from "../../common/mixin";
    import {POP,NEW,SELL} from "../../common/const";
    import {getHomeData,getSearchMessage} from "../../network/home";
    import Info from "../info/Info";

    export default {
        name: "Home",
        components: {Info, GoodsList,TabControl, HomeSwiper, RecommandView, TabBarItem,NavBar, TabBar,Scroll},
        data(){
            return {
                Text: ['流行','新款','精选'],
                goods: {
                    'pop': {page: 0,list:[]},
                    'new': {page: 0,list:[]},
                    'sell': {page: 0,list:[]}
                    },
                currentType: 'pop',
                tabOffSetTop: 0,
                isTabFixed: false,
                saveY :0,
                itemImgListener: null,
                searchMessage:''

            }
        },
        mixins:[itemListenerMixin,backTopMixin],
        computed: {
            showGoods(){
                return this.goods[this.currentType].list
            }
        },
        methods: {
          changeGoods(index){
             switch (index) {
                 case 0:
                     this.currentType = 'pop'
                     break
                 case 1:
                     this.currentType = 'new'
                     break
                 case 2:
                     this.currentType = 'sell'
                 break;
             }
             this.$refs.tabControl2.currentIndex = index
             this.$refs.tabControl.currentIndex= index
          },
          // backToTop(){
              // scrollTo回到某一个位置（x,y)
              // props是父组件传子组件 ref refs是子组件传父组件
              // this.$refs.scroll.scroll && this.$refs.scroll.scroll.scrollTo(0,0,500)
          // },
          showBackTop(position){
              this.isShow = (position.y < -1000)

              this.isTabFixed = (-position.y> this.tabOffSetTop)
          },
          loadMore(){
             this.goods[this.currentType].list.push(...this.goods['sell'].list)
              this.$refs.scroll.finishPullUp()
          },
          swiperImgLoad(){
              this.tabOffSetTop = this.$refs.tabControl.$el.offsetTop;
          },
          getHomeProducts(type){
              getHomeData(type).then(res=>{
                  this.goods[type].list.push(...res.data)
              })
          },
          showMessage(){
              console.log(this.searchMessage);
              this.searchMessage = '';
          },
          getGoodsMessage(){
              getSearchMessage(this.searchMessage).then(res=>{

              })
          }
        },
        mounted() {
            // 防抖函数 debounce
            // const refresh = debounce(this.$refs.scroll.refresh,200)
            // this.itemImgListener = ()=>{
            //     refresh()
            // }
            // this.$bus.$on('itemImgLoad',this.itemImgListener)
            // $el可以拿到组件内部的所有元素
        },
        created() {

            this.getHomeProducts(POP)
            this.getHomeProducts(NEW)
            this.getHomeProducts(SELL)
        },
        destroyed() {
            console.log('home被销毁啦');
        },
        activated() {
            this.$refs.scroll.scroll.scrollTo(0,this.saveY,0)
            this.$refs.scroll.refresh()
        },
        deactivated() {
            this.saveY = this.$refs.scroll.scroll.y
            this.$bus.$off('itemImgLoad',this.itemImgListener)
        }
    }
</script>

<style scoped>
   .home {
         height: 100vh;
         position: relative;

   }
   .nav-bar {
       background-color: #ff8198;
       font-weight: 700;
       color: #ffffff;
   }

   .fixed {
       position: fixed;
       left: 0;
       right: 0;
       height: 44px;
   }

   .content {
       position: absolute;
       top: 44px;
       bottom: 49px;
       overflow: hidden;
       left: 0;
       right: 0;

   }

   .tab-control {
       position: relative;
       z-index: 9;
       background-color: #ffffff;
   }

   .searchBox {
       border-radius: 5px;
       background: #fff;
   }

    .btn_Search {
        border-radius: 5px;
        margin-left: 5px;
    }



</style>
