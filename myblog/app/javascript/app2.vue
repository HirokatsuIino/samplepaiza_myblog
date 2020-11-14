<template>
    <div>
        <router-view></router-view>
    </div>
</template>

<script>
    import Vue from 'vue'
    import VueRouter from 'vue-router'

    import ArticleIndexPage from 'ArticleIndexPage.vue'
    import ArticleDetailPage from 'ArticleDetailPage.vue'
    import NotFound from 'NotFound.vue'

    const router = new VueRouter({
        mode: 'history',
        routes: [
            { path: '*',　//ここから3行追記
                name: NotFound,
                component: NotFound },
            { path: '/articles',
                name: ArticleIndexPage,
                component: ArticleIndexPage  },
            { path: '/articles/:id',  // :id は数値のみに制限する
            // { path: '/articles/:id(\\d+)',  // :id は数値のみに制限する
                name: ArticleDetailPage,
                component: ArticleDetailPage  },

        ]
    })

    // ref. https://jp.vuejs.org/v2/guide/plugins.html#%E3%83%97%E3%83%A9%E3%82%B0%E3%82%A4%E3%83%B3%E3%81%AE%E4%BD%BF%E7%94%A8
    Vue.use(VueRouter)

    export default {
        router
    }
</script>

<style scoped>
</style>