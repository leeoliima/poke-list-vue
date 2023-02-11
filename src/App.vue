<template>
  <Navbar />
  <router-view />
  <Footer />
</template>

<script>
import Navbar from "./components/Navbar.vue";
import Footer from "./components/Footer.vue";

export default {
  name: `App`,
  components: {
    Navbar,
    Footer,
  },
  data() {
    return {};
  },
};
</script>

<style>
* {
  margin: 0;
  padding: 0;
}
.h1 {
  text-align: center;
  font-size: 42px;
}
</style>
