<template>
    <div id="category">
        <nav-bar class="nav-bar"><div slot="center">商品分类</div></nav-bar>
        <category-menu @showGoods="showGoods"></category-menu>
        <scroll class="content">
            <goods-list :goods="goods.list"></goods-list>
        </scroll>
    </div>
</template>

<script>
    import NavBar from "components/common/navbar/NavBar";
    import CategoryMenu from "./childComps/CategoryMenu";
    import GoodsList from "components/content/goods/GoodsList";
    import Scroll from "../../components/common/scroll/Scroll";
    import {getDetailKind} from "../../network/category";

    export default {
        name: "Category",
        components: {Scroll, NavBar,CategoryMenu,GoodsList},
        data(){
            return {
                goods:{list:[]}
            }
        },
        methods: {
            showGoods(index){
                let kind = null
                switch (index) {
                    case 0: kind = 'clothes'
                            break
                    case 1: kind = 'pants'
                        break
                    case 2: kind = 'dress'
                        break
                    case 3: kind = 'suit'
                        break
                    case 4: kind = 'bras'
                        break
                    case 5: kind = 'shoes'
                        break
                    case 6: kind = 'skincare'
                        break
                    case 7: kind = 'makeup'
                        break
                    case 8: kind = 'sport'
                        break
                    default: kind = "clothes"
                        break
                 }
                 getDetailKind(kind).then(res=>{
                     this.goods.list = []
                     this.goods.list.push(...res.data)
                 })
            }
        },
        created() {
            getDetailKind('clothes').then(res=>{
                this.goods.list = []
                this.goods.list.push(...res.data)
            })
        }
    }
</script>

<style scoped>
    #category {
        height: 100vh;
    }
    .content {
        position: absolute;
        left: 100px;
        top: 44px;
        bottom: 49px;
        z-index: 9;
        overflow: hidden;
    }
</style>
