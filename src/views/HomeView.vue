<template>
  <div class="home">
    <h1 class="h1">Home</h1>
    <Card />
  </div>
</template>

<script>
import Card from "@/components/Card.vue";
export default {
  name: "HomeView",

  components: {
    Card,
  },
};
</script>
