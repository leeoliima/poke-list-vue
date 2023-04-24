<template>
  <nav id="navbar">
    <router-link to="/">
      <img src="../assets/poke-wht.png" alt="Logo do site" id="logo" />
    </router-link>
    <h1>Poke List</h1>
    <router-link to="/"><h1>Home</h1> </router-link>
  </nav>
</template>

<script>
export default {
  name: "Navbar",
  // props:["logo", "alt"]
};
</script>

<style scoped>
#logo {
  width: 40px;
  height: 40px;
}
#logo :hover {
  transform: rotate(1turn);
  transition: 0.8s;
}

#navbar {
  display: flex;
  justify-content: space-around;
  align-items: center;
  background: #333;
  color: whitesmoke;
  text-decoration: underline;
  padding: 10px;
}
#navbar a {
  text-decoration: none;
  color: #fff;
  font-size: 15px;
  transition: 0.5s;
}
#navbar a:hover {
  text-decoration: underline;
  color: gray;
  font-size: 15px;
}
</style>
