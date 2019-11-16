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
    import {getGoodsDetail, getGoodsImg, getHomeMultiData} from "../../network/home";


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
                    id: null,
                    title: null,
                    oldPrice: null,
                    price: null,
                    columns: ['销量10042', '收藏616人', '退货补运费'],
                    desc: null,
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
                    img:[]
                },
                goods: [],
                itemImgListener: null,
                themeTopYs:[],
                getThemeTop:null,

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
            getGoodsDetail(4).then(res=>{
                const detail = res.data
                this.detailGoods.id = detail.id
                this.detailGoods.title = detail.title
                this.detailGoods.oldPrice = detail.oldprice
                this.detailGoods.price = detail.price
                this.detailGoods.desc = detail.desc
            })
            getHomeMultiData().then(res=>{
                this.goods.push(...res.data)
            })
            getGoodsImg(4).then(res=>{
               const detail = res.data
               detail.forEach(item=>{
                   this.detailGoods.img.push(item.url)
               })
            })
        },
        mounted() {
            getGoodsDetail(4).then(res=>{
                const detail = res.data
                this.detailGoods.id = detail.id
                this.detailGoods.title = detail.title
                this.detailGoods.oldPrice = detail.oldprice
                this.detailGoods.price = detail.price
                this.detailGoods.desc = detail.desc
            })
            getHomeMultiData().then(res=>{
                this.goods.push(...res.data)
            })
            getGoodsImg(4).then(res=>{
                const detail = res.data
                detail.forEach(item=>{
                    this.detailGoods.img.push(item.url)
                })
            })
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
                    this.$toast('加入购物车成功',4000)
                })
            },
            toBuy(){
                this.$toast('购买成功')
            }

        },
        updated() {
            this.getThemeTop()
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
