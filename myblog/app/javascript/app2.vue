<template>
  <div id="app">
    <table>
      <tbody>
      <tr>
        <th>ID</th>
        <th>name</th>
        <th>content</th>
        <th>created_at</th>
      </tr>
      <tr v-for="e in employees" :key="e.id">
        <td>{{ e.id }}</td>
        <td>{{ e.name }}</td>
        <td>{{ e.content }}</td>
        <td>{{ e.created_at }}</td>
      </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
    import axios from 'axios';

    export default {
        data: function () {
            return {
                employees: []
            }
        },
        mounted () {
            axios
                .get('/api/v1/articles.json')
                .then(response => (this.employees = response.data))
        }
    }
</script>

<style scoped>
  p {
    font-size: 2em;
    text-align: center;
  }
</style>