<template>
    <div id="articles">

        <!--<h1>{{ message }}</h1>-->

        <!--<div>検索：<input type="text" v-model="search"></div>-->

        <table>
            <tbody>
            <tr>
                <th>ID</th>
                <th>name</th>
                <th>admin_comment</th>
                <th>area_important</th>
                <th>nav_id</th>
                <th>created_at</th>
            </tr>
            <tr v-for="e in employees" :key="e.id">
                <td>{{ e.id }}</td>
                <td>{{ e.name }}</td>
                <td>{{ e.admin_comment }}</td>
                <td>{{ e.area_important }}</td>
                <td>{{ e.nav_id }}</td>
                <td>{{ e.created_at }}</td>
                <td><router-link :to="`/articles/${ e.id }`">詳細</router-link></td>
                <!--<td><router-link :to="`/articles/${ e.id }`">詳細</router-link></td>-->
                <!--<td><router-link :to="{name: 'ArticleDetailPage', params: {id: '1' }}" class="btn btn-info">詳細</router-link></td>-->
            </tr>
            </tbody>
        </table>
        <router-link to="/create">本の登録</router-link>
    </div>
</template>

<script>
    import axios from 'axios';
    import Qs from 'qs'

    export default {
        name: "ClientIndexPage.vue",
        data: function () {
            return {
                employees: [],
                message: 'Search/Filter In Table',
                // search:'',
                // query: {
                //     id: null,
                //     name: null,
                //     content: null,
                // }

            }
        },
        // computed: {
        //     employees() {
        //         return this.employees.filter(e => {
        //             return e.content.includes(this.search)
        //         })
        //     }
        // },
        mounted () {
            axios
                .get('/api/v1/clients.json')
                .then(response => (this.employees = response.data))

            // axios.get('/api/v1/articles.json',{
            //     params:{
            //         q: this.query
            //     },
            //     paramsSerializer: function(params) {
            //         return Qs.stringify(params, {arrayFormat: 'brackets'})
            //     }
            //
            //     .then(response => (this.employees = response.data))

            // })
        }

    }
</script>

<style scoped>
    p {
        font-size: 2em;
        text-align: center;
    }

</style>






