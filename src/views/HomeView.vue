
<template>
  <main>
    <h1>Bem vindo a Pagina inicial</h1>
    <div>
      <h4>Server Info</h4>
      <ul>
        <li>UpTime: {{ healtCheck.uptime }} segundos teste</li>
        <li>Message: {{ healtCheck.message }}</li>
        <li>Date: {{ healtCheck.date }}</li>
      </ul>
    </div>
  </main>
</template>

<script>
import HealthCheckApi from "../services/api";
export default {
  data() {
    return {
      healtCheck: {},
    };
  },
  async mounted() {
    console.log(process.env.VUE_APP_BACKEND_URL);
    const { data } = await HealthCheckApi.healthcheck();
    this.healtCheck = data;
  },
};
</script>
