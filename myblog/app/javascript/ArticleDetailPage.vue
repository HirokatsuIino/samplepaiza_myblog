<template>
    <div id="articles-show">
        <p>
            <strong>ID:</strong>
            {{ employees.id }}
        </p>

        <p>
            <strong>Name:</strong>
            {{ employees.name }}
        </p>

        <p>
            <strong>Content:</strong>
            {{ employees.content }}
        </p>

        <p>
            <strong>Feeling:</strong>
            {{ employees.feeling }}
        </p>

        <p>
            <router-link :to="`/articles/`">戻る</router-link>
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
        name: "ArticleDetailPage.vue",
        data: function () {
            return {
                employees: {}
            }
        },
        mounted: function() {
            this.fetchArticleDetail();
        },
        methods: {
            fetchArticleDetail: function() {
                axios.get(`/api/v1/articles/${this.$route.params.id}`)
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






