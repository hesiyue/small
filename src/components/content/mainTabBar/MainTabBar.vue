<template>
        <tab-bar class="tabbar">
            <tab-bar-item link="/home" >
                <div slot="s_news">首页</div>
                <img src="~assets/img/tabbar/home.svg" slot="s_icon">
                <img src="~assets/img/tabbar/home_active.svg" slot="s_active_icon">
            </tab-bar-item>
            <tab-bar-item link="/category">
                <div slot="s_news">分类</div>
                <img src="~assets/img/tabbar/category.svg" slot="s_icon">
                <img src="~assets/img/tabbar/category_active.svg" slot="s_active_icon">
            </tab-bar-item>
            <tab-bar-item link="/car">
                <div slot="s_news">购物车</div>
                <img src="~assets/img/tabbar/cart.svg" slot="s_icon">
                <img src="~assets/img/tabbar/cart_active.svg" slot="s_active_icon">
            </tab-bar-item>
            <tab-bar-item link="/info">
                <div slot="s_news">我的</div>
                <img src="~assets/img/tabbar/profile.svg" slot="s_icon">
                <img src="~assets/img/tabbar/profile_active.svg" slot="s_active_icon">
            </tab-bar-item>
        </tab-bar>
</template>

<script>
    import TabBar from "common/tabbar/TabBar";
    import TabBarItem from "common/tabbar/TabBarItem";
    export default {
        name: "MainTabBar",
        components: {
            TabBar,
            TabBarItem
        }
    }
</script>

<style scoped>

</style>
