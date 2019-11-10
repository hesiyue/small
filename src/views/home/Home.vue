<template>
    <div class="home">
       <nav-bar class="nav-bar"><div slot="center">主页</div></nav-bar>
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

    export default {
        name: "Home",
        components: {GoodsList,TabControl, HomeSwiper, RecommandView, TabBarItem,NavBar, TabBar,Scroll},
        data(){
            return {
                Text: ['流行','新款','精选'],
                goods: {
                    'pop': {page:0,list: [{id:1,img:'https://s5.mogucdn.com/mlcdn/776a41/191030_3g5fc5k3djc7f27eb6d30fa328kb1_750x1125.jpg_440x587.v1cAC.40.webp',message:'白色丝袜',price:66.7,collect:77},
                            {id:2,img:'https://s5.mogucdn.com/mlcdn/776a41/191104_08d4ih63dfl7h1ggglb077a2jih08_750x1125.jpg_440x587.v1cAC.40.webp',message:'白色裙子',price:128,collect:255},
                            {id:3,img:'https://s5.mogucdn.com/mlcdn/776a41/191030_635fch4eh1ei0ghce7d04gd29lgak_750x1125.jpg_440x587.v1cAC.40.webp',message:'黑色漂亮裙子',price:256,collect:376},
                            {id:4,img:'https://s5.mogucdn.com/mlcdn/776a41/191030_075hg9d288045ca35h4b23342c093_750x1125.jpg_440x587.v1cAC.40.webp',message:'赫本小黑裙',price:1128,collect:2525}]},
                    'news': {page:0,list:[
                            {id:5,img:'https://s5.mogucdn.com/mlcdn/c45406/191029_7be58ijgibilbli09dgcehg72124j_640x960.jpg_440x587.v1cAC.40.webp',message:'仙女韩范小白裙',price:109,collect:33},
                            {id:6,img:'https://s5.mogucdn.com/mlcdn/776a41/191104_1fjahe25aehc8e662i7bji8002abi_750x1125.jpg_440x587.v1cAC.40.webp',message: '秋季法式白裙',price:98,collect: 494},
                            {id:7,img:'https://s5.mogucdn.com/mlcdn/776a41/191104_373i6dd9belbjg59ebhce084ceh3h_750x1125.jpg_440x587.v1cAC.40.webp',message:'春秋螺纹灰色打底裤',price:28,collect:487},
                            {id:8,img:'https://s5.mogucdn.com/mlcdn/776a41/191104_3473i6lil32h11c7jd2if9b4fah0f_750x1125.jpg_440x587.v1cAC.40.webp',message:'黑色牛仔裤',price:98,collect:876},
                        ]},
                    'sell': {page:0,list:[
                            {id:9,img:'https://s5.mogucdn.com/mlcdn/776a41/191104_625l8c9fhd581ace37c675ealc728_750x1125.jpg_440x587.v1cAC.40.webp',message:'加绒牛仔裤',price:109,collect:33},
                            {id:10,img:'https://s5.mogucdn.com/mlcdn/776a41/191104_08bh2fba3c00e0hbl07j783g36ehf_750x1125.jpg_440x587.v1cAC.40.webp',message:'打底裤秋季女袜',price:109,collect:33},
                            {id:11,img:'https://s5.mogucdn.com/mlcdn/776a41/191104_8ef9e560hj4eb6310112c73h3j25j_750x1125.jpg_440x587.v1cAC.40.webp',message:'高腰牛仔裤',price:1069,collect:332},
                            {id:12,img:'https://s5.mogucdn.com/mlcdn/776a41/191104_14c818dbfe8675b78db8ghfk6lj12_750x1125.jpg_440x587.v1cAC.40.webp',message:'黑色宽松运动裤',price:169,collect:32},

                        ]},

                },
                currentType: 'pop',
                tabOffSetTop: 0,
                isTabFixed: false,
                saveY :0,
                itemImgListener: null

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
                     this.currentType = 'news'
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




</style>
