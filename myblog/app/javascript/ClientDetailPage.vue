<template>
    <div id="articles-show">
        <table>
            <tbody>
            <tr>
                <th style="width: 30px;">ID</th>
                <th style="width: 30px;">client_id</th>
                <th style="width: 30px;">name</th>
                <th style="width: 30px;">admin_comment</th>
                <th style="width: 30px;">area_important</th>
                <th style="width: 30px;">nav_id</th>
                <th style="width: 30px;">created_at</th>
            </tr>
            <tr>
                <td style="width: 30px;">{{ employees.id }}</td>
                <td style="width: 30px;">{{ employees.client_id }}</td>
                <td style="width: 30px;">{{ employees.name }}</td>
                <td style="width: 30px;">{{ employees.admin_comment }}</td>
                <td style="width: 30px;">{{ employees.area_important }}</td>
                <td style="width: 30px;">{{ employees.nav_id }}</td>
                <td style="width: 30px;">{{ employees.created_at }}</td>
                <!--<td><router-link :to="`/articles/${ e.id }`">詳細</router-link></td>-->
                <!--<td><router-link :to="`/articles/${ e.id }`">詳細</router-link></td>-->
                <!--<td><router-link :to="{name: 'ArticleDetailPage', params: {id: '1' }}" class="btn btn-info">詳細</router-link></td>-->
            </tr>
            </tbody>
        </table>

        <!--<div>-->
            <!--<p>ID:{{ employees.id }}</p>-->
        <!--</div>-->

        <!--<p>-->
            <!--<strong>Name:</strong>-->
            <!--{{ employees.name }}-->
        <!--</p>-->

        <!--<p>-->
            <!--<strong>Content:</strong>-->
            <!--{{ employees.content }}-->
        <!--</p>-->

        <!--<p>-->
            <!--<strong>Feeling:</strong>-->
            <!--{{ employees.feeling }}-->
        <!--</p>-->

        <p>
            <router-link :to="`/clients/`">戻る</router-link>
        </p>



        <!--<table>-->
            <!--<tbody>-->
            <!--<tr>-->
                <!--<th>ID</th>-->
                <!--<th>name</th>-->
                <!--<th>content</th>-->
                <!--<th>updated_at</th>-->
            <!--</tr>-->
            <!--<tr>-->
                <!--<td>{{ employees.id }}</td>-->
                <!--<td>{{ employees.name }}</td>-->
                <!--<td>{{ employees.content }}</td>-->
                <!--<td>{{ employees.updated_at }}</td>-->
            <!--</tr>-->
            <!--</tbody>-->
        <!--</table>-->
    </div>
</template>

<script>
    import axios from 'axios';

    export default {
        name: "ClientDetailPage.vue",
        data: function () {
            return {
                employees: {}
            }
        },
        mounted: function() {
            this.fetchClientDetail();
        },
        methods: {
            fetchClientDetail: function() {
                axios.get(`/api/v1/clients/${this.$route.params.id}`)
                    .then(response => (this.employees = response.data))
            }
        }
    }
</script>

<style scoped>
    p {
        font-size: 2em;
        text-align: center;
    }

</style>






