<template>
  <div id="card-container">
    <section id="input-search">
      <input
        id="input"
        type="text"
        v-model="searchTerm"
        placeholder="Pesquise um Pokémon"
      />
    </section>

    <div id="card" v-for="pokemon in filteredPokemons" :key="pokemon.id">
      <img :src="pokemon.img" alt="Imagem do Pokémon" />
      <p>#{{ pokemon.id }}</p>
      <h3>{{ pokemon.name }}</h3>
      <button id="button" @click="goToDetails(pokemon.id)">Detalhes</button>
    </div>
  </div>
  <div
    class="pokemon-undefined"
    v-show="filteredPokemons.length === 0 && searchTerm !== ''"
  >
    <h3>Pokemon não encontrado, tente novamente.</h3>
  </div>
</template>

<script>
export default {
  name: "Card",
  data() {
    return {
      pokemons: [],
      searchTerm: "",
    };
  },
  computed: {
    filteredPokemons() {
      return this.pokemons.filter((pokemon) => {
        return pokemon.name
          .toLowerCase()
          .includes(this.searchTerm.toLowerCase());
      });
    },
  },
  methods: {
    async fetchPokemons() {
      const api = await fetch(
        `https://pokeapi.co/api/v2/pokemon/?limit=500&offset=0`
      );
      const data = await api.json();
      this.pokemons = data.results.map((pokemon) => {
        return {
          id: pokemon.url.split("/")[6],
          name: pokemon.name,
          img: `https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${
            pokemon.url.split("/")[6]
          }.png`,
        };
      });
    },
    goToDetails(pokemonId) {
      this.$router.push({ name: "details", params: { pokemonId: pokemonId } });
    },
  },

  mounted() {
    this.fetchPokemons()
  },
};
</script>

<style scoped>
#card-container {
  flex-wrap: wrap;
  display: flex;
  justify-content: space-between;
}

#card {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  padding: 2em 1em;
  margin: 2em;
  width: 15em;
  border-radius: 1em;
  border: 1px solid #cea5a3;
  box-shadow: 5px 5px 5px lightgray;
  cursor: pointer;
}
#card :hover {
  transform: translate(0px, -2%);
  transition: 0.3s;
  color: #b93030;
}

#card p {
  background-color: #fff;
  font-size: 20px;
}

#card :hover p {
  color: #e33d33;
  background-color: #fff;
}
#card :hover a {
  color: #e33d33;
  background-color: #fff;
}

#card :hover p {
  margin: 1em 0;
  background-color: #e33d33;
  border-radius: 0.5em;
  padding: 5px;
  color: #fff;
  display: flex;
  justify-content: center;
  align-items: center;
}
#card :hover h3 {
  text-transform: capitalize;
  margin-bottom: 1em;
  font-size: 1.2em;
}
#card :hover a {
  text-decoration: none;
  background-color: #333;
  color: #fff;
  padding: 0.7em 1.2em;
  border-radius: 1em;
  font-weight: bold;
  transition: 0.4s;
}

#input-search {
  display: flex;
  justify-content: space-evenly;
  width: 100%;
  margin: 20px;
}
#input {
  width: 50vw;
  height: 4vh;
  padding: 5px;
  justify-content: center;
  align-items: center;
  text-align: center;
  font-size: 15px;
  background-color: whitesmoke;
  border-radius: 8px;
  border: none;
}

.pokemon-undefined h3 {
  display: flex;
  justify-content: center;
  margin-top: 100px;
  text-align: center;
}

button {
  text-decoration: none;
  background-color: #333;
  color: #fff;
  padding: 0.4em 1.2em;
  border-radius: 8px;
  font-weight: bold;
  transition: 0.4s;
  cursor: pointer;
}
</style>
