<template>
    <div class="detail" >
        <detail-nav-bar @titleClick="titleClick" ref="navBar"></detail-nav-bar>
        <back-top @click.native="backToTop" v-show="isShow"></back-top>
        <scroll class="content"
                ref="scroll"
                @scrollBack="contentScroll"
                @scroll="showBackTop"
                :probeType="3">
            <detail-swiper :detail-goods="detailGoods"></detail-swiper>
            <detail-base-info :goods="detailGoods"></detail-base-info>
            <detail-shop-info :goods="detailGoods"></detail-shop-info>
            <detail-goods-info :detail-info="detailGoods"></detail-goods-info>
            <detail-param-info :param-info="detailGoods" ref="param"></detail-param-info>
            <detail-comment-info :comment-info="detailGoods.rate" ref="comment"></detail-comment-info>
            <h2 align="center" class="info-header">热门推荐</h2>
                <goods-list :goods="goods"  ref="recommand"></goods-list>
        </scroll>
        <detail-bottom-bar @addCart="addCart" @toBuy="toBuy"></detail-bottom-bar>
    </div>
</template>

<script>
    import DetailNavBar from "./childComps/DetailNavBar";
    import DetailSwiper from "./childComps/DetailSwiper";
    import DetailBaseInfo from "./childComps/DetailBaseInfo";
    import DetailShopInfo from "./childComps/DetailShopInfo";
    import Scroll from "components/common/scroll/Scroll";
    import DetailGoodsInfo from "./childComps/DetailGoodsInfo";
    import DetailParamInfo from "./childComps/DetailParamInfo";
    import DetailCommentInfo from "./childComps/DetailCommentInfo";
    import GoodsList from "components/content/goods/GoodsList";
    import {itemListenerMixin,backTopMixin} from "../../common/mixin";
    import {debounce} from "../../common/utils";
    import DetailBottomBar from "./childComps/DetailBottomBar";


    export default {
        name: "Detail",
        components: {
            Scroll,
            DetailNavBar,
            DetailSwiper,
            DetailBaseInfo,
            DetailShopInfo,
            DetailGoodsInfo,
            DetailParamInfo,
            DetailCommentInfo,
            GoodsList,
            DetailBottomBar
        },
        mixins:[itemListenerMixin,backTopMixin],
        data(){
            return {
                id: null,
                detailGoods: {
                    id: 2,
                    title: '秋季新款法式复古中长款系绳收腰针织连衣裙宽松显廋打底毛衣裙子',
                    oldPrice: 155,
                    price: 109,
                    columns: ['销量10042', '收藏616人', '退货补运费'],
                    desc: '该产品买五件打七折',
                    rate: {
                        cRate: 125,
                        canExplain: false,
                        content: '物美价廉，刚好合适,衣服面料很好，非常棒',
                        created: '1535694719',
                        extraInfo: {'是否合身': '合身'},
                        images: ['https://s5.mogucdn.com/mlcdn/c45406/190829_3h86ej1dih0172j8e5ei3bef48817_640x960.jpg_468x468.jpg',
                            'https://s5.mogucdn.com/mlcdn/c45406/190829_4dkf1048bgihc3g0bkd5ek0ij0918_650x650.jpg_750x999.jpg'],
                        style: '颜色:杏色  尺码:M',
                        user: {
                            avatar: 'https://s5.mogucdn.com/p1/160105/idid_ifrwenbygrsggntfguzdambqhayde_160x160.jpg_64x64.jpg',
                            uname: 'hhh'
                        }
                    },
                    infos: [
                        ['图案','纯色'],
                        ['裙型', 'A字裙'],
                        ['颜色','杏色'],
                        ['裙长','中长裙'],
                        ['季节','秋袖'],
                        ['风格','淑女'],
                        ['潮流','韩系']
                    ],
                    tables:[
                        ['尺码','M','L','XL','XXL'],
                        ['衣长','61.5','63','64.5','66'],
                        ['胸围','98','104','110','116'],
                        ['袖长','63','66','68.5','70.5']
                    ],
                    shop: {
                        logo: 'https://s5.mogucdn.com/p1/160205/1xebxb_ifrtaytggq3wknzygyzdambqhayde_200x200.jpg_100x100.jpg_100x100.jpg',
                        shopUrl: 'https://shop.mogu.com/1p788q?ptp=31.5bTmG.0.0.Wl5UwJvy',
                        name: '千千衣莎',
                        sells:8800,
                        goodsCount: 99,
                        keyInfo:'卖家图如下：',
                        score: [{name:'描述相符',scores:4.64,isBetter:false},
                                    {name:'价格合理',scores:5,isBetter:true},
                                    {name:'质量满意',scores:4.62,isBetter:false}]
                    },
                    image1: ['https://s11.mogucdn.com/mlcdn/776a41/191106_2ej91iibg602c8fbc777hicj3ci3f_750x1000.jpg_468x468.jpg',
                    'https://s5.mogucdn.com/mlcdn/c45406/190829_5j56k32a27jijde52dl6238f269ji_640x960.jpg_468x468.jpg',
                    'https://s11.mogucdn.com/mlcdn/c45406/190829_69ej20id7ad6570j4ld550a3j8463_640x960.jpg_468x468.jpg',
                    'https://s5.mogucdn.com/mlcdn/c45406/190829_35c1dfh3ik0f63b38fk04533dgf3c_640x960.jpg_468x468.jpg',
                    'https://s5.mogucdn.com/mlcdn/c45406/190829_3h86ej1dih0172j8e5ei3bef48817_640x960.jpg_468x468.jpg'],
                    image2: ['https://s5.mogucdn.com/mlcdn/c45406/190829_6f178cbge9b13e89le93bal6e4c61_650x650.jpg_750x999.jpg',
                    'https://s5.mogucdn.com/mlcdn/c45406/190829_4dkf1048bgihc3g0bkd5ek0ij0918_650x650.jpg_750x999.jpg',
                    'https://s5.mogucdn.com/mlcdn/c45406/190829_1dek89g7c37gf94ck9ecb6aig3gfl_650x683.jpg_750x999.jpg',
                    'https://s5.mogucdn.com/mlcdn/c45406/190829_582bff54bib54g30c6ga162c9jjhf_650x650.jpg_750x999.jpg',
                    'https://s5.mogucdn.com/mlcdn/c45406/190829_6ke99cchc7a84j59k7e66ijajfe12_650x650.jpg_750x999.jpg',
                    'https://s5.mogucdn.com/mlcdn/c45406/190829_1adfgi8c411b6ih5fik190g0blhg6_650x650.jpg_750x999.jpg']
                },
                goods: [
                            {id:1,img:'https://s5.mogucdn.com/mlcdn/776a41/191030_3g5fc5k3djc7f27eb6d30fa328kb1_750x1125.jpg_440x587.v1cAC.40.webp',message:'白色丝袜',price:66.7,collect:77},
                            {id:2,img:'https://s5.mogucdn.com/mlcdn/776a41/191104_08d4ih63dfl7h1ggglb077a2jih08_750x1125.jpg_440x587.v1cAC.40.webp',message:'白色裙子',price:128,collect:255},
                            {id:3,img:'https://s5.mogucdn.com/mlcdn/776a41/191030_635fch4eh1ei0ghce7d04gd29lgak_750x1125.jpg_440x587.v1cAC.40.webp',message:'黑色漂亮裙子',price:256,collect:376},
                            {id:4,img:'https://s5.mogucdn.com/mlcdn/776a41/191030_075hg9d288045ca35h4b23342c093_750x1125.jpg_440x587.v1cAC.40.webp',message:'赫本小黑裙',price:1128,collect:2525},
                            {id:5,img:'https://s5.mogucdn.com/mlcdn/c45406/191029_7be58ijgibilbli09dgcehg72124j_640x960.jpg_440x587.v1cAC.40.webp',message:'仙女韩范小白裙',price:109,collect:33},
                            {id:6,img:'https://s5.mogucdn.com/mlcdn/776a41/191104_1fjahe25aehc8e662i7bji8002abi_750x1125.jpg_440x587.v1cAC.40.webp',message: '秋季法式白裙',price:98,collect: 494},
                            {id:7,img:'https://s5.mogucdn.com/mlcdn/776a41/191104_373i6dd9belbjg59ebhce084ceh3h_750x1125.jpg_440x587.v1cAC.40.webp',message:'春秋螺纹灰色打底裤',price:28,collect:487},
                            {id:8,img:'https://s5.mogucdn.com/mlcdn/776a41/191104_3473i6lil32h11c7jd2if9b4fah0f_750x1125.jpg_440x587.v1cAC.40.webp',message:'黑色牛仔裤',price:98,collect:876},
                            {id:9,img:'https://s5.mogucdn.com/mlcdn/776a41/191104_625l8c9fhd581ace37c675ealc728_750x1125.jpg_440x587.v1cAC.40.webp',message:'加绒牛仔裤',price:109,collect:33},
                            {id:10,img:'https://s5.mogucdn.com/mlcdn/776a41/191104_08bh2fba3c00e0hbl07j783g36ehf_750x1125.jpg_440x587.v1cAC.40.webp',message:'打底裤秋季女袜',price:109,collect:33},
                            {id:11,img:'https://s5.mogucdn.com/mlcdn/776a41/191104_8ef9e560hj4eb6310112c73h3j25j_750x1125.jpg_440x587.v1cAC.40.webp',message:'高腰牛仔裤',price:1069,collect:332},
                            {id:12,img:'https://s5.mogucdn.com/mlcdn/776a41/191104_14c818dbfe8675b78db8ghfk6lj12_750x1125.jpg_440x587.v1cAC.40.webp',message:'黑色宽松运动裤',price:169,collect:32}
                      ],
                itemImgListener: null,
                themeTopYs:[],
                getThemeTop:null
            }
        },
        created() {
            this.id = this.$route.params.id
            this.getThemeTop = debounce(()=>{
                this.themeTopYs = []
                this.themeTopYs.push(0)
                 this.themeTopYs.push(this.$refs.param.$el.offsetTop)
                this.themeTopYs.push(this.$refs.comment.$el.offsetTop)
                this.themeTopYs.push(this.$refs.recommand.$el.offsetTop)
            },100)
        },
        mounted() {
            this.getThemeTop()
        },
        activated() {
        },
        destroyed() {
            this.$bus.$off('itemImgLoad',this.itemImgListener)
        },
        methods: {
            titleClick(index){
                this.$refs.scroll.scroll.scrollTo(0,-this.themeTopYs[index],200)
            },
            contentScroll(position){
                if(-position.y<(this.themeTopYs[1]))
                    this.$refs.navBar.currentIndex = 0
                else if(-position.y<(this.themeTopYs[2]))
                    this.$refs.navBar.currentIndex=1
                else if(-position.y<(this.themeTopYs[3]))
                    this.$refs.navBar.currentIndex= 2
                else
                    this.$refs.navBar.currentIndex= 3

            },
            showBackTop(position){
                this.isShow = (position.y < -1000)

                this.isTabFixed = (-position.y> this.tabOffSetTop)
            },
            addCart(){
                const product = {
                    image: 'https://s5.mogucdn.com/mlcdn/c45406/190829_35c1dfh3ik0f63b38fk04533dgf3c_640x960.jpg_468x468.jpg',
                    title: this.detailGoods.title,
                    desc:  this.detailGoods.desc,
                    price: this.detailGoods.price,
                    id: this.detailGoods.id
                }
                // 调用mutations时用commit,调用actions用patch
                // this.$store.commit('addCart',product)
                this.$store.dispatch('addCart',product).then(res=>{
                    console.log(res);
                })
            },
            toBuy(){
                console.log('购买成功');
            }

        },
        updated() {

        }
    }
</script>

<style scoped>
  .detail {
      height: 100vh;
      position: relative;
      z-index: 9;
      background-color: #fff;
  }

  .content {
      position: absolute;
      top: 44px;
      bottom: 49px;
      overflow: hidden;
      left: 0;
      right: 0;
      background-color: #fff;

  }

  .info-header {
      line-height: 40px;
      padding-left: 8px;
      font-size: 15px;
      color: #333;
  }
</style>
