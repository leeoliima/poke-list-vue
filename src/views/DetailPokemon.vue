<template>
  <div id="card-details">
    <h2>Detalhes do Pokémon</h2>
    <div v-if="!pokemon.id">Não foi possível encontrar o Pokémon.</div>
    <div v-else>
      <img
        v-if="pokemon.sprites"
        :src="pokemon.sprites.front_default"
        alt="Pokemon Image"
      />
      <h2>{{ pokemon.name }}</h2>
      <div>
        <p>Height: {{ pokemon.height }}</p>
        <p>Weight: {{ pokemon.weight }}</p>
        <p>
          Types:
          {{
            pokemon.types
              ? pokemon.types.map((t) => t.type.name).join(", ")
              : ""
          }}
        </p>
        <p>HP: {{ pokemon.stats[0].base_stat }}</p>
        <p>Attack: {{ pokemon.stats[1].base_stat }}</p>
        <p>Defense: {{ pokemon.stats[2].base_stat }}</p>
        <p>Special Attack: {{ pokemon.stats[3].base_stat }}</p>
        <p>Special Defense: {{ pokemon.stats[4].base_stat }}</p>
        <p>Speed: {{ pokemon.stats[5].base_stat }}</p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "PokemonDetails",
  data() {
    return {
      pokemon: {},
    };
  },
  methods: {
    async fetchPokemonDetails(pokemonId) {
      try {
        const api = await fetch(
          `https://pokeapi.co/api/v2/pokemon/${pokemonId}`
        );
        const data = await api.json();

        this.pokemon = {
          id: data.id,
          name: data.name,
          sprites: data.sprites,
          height: data.height,
          weight: data.weight,
          types: data.types,
          stats: data.stats,
        };
      } catch (error) {
        console.error(error);
      }
    },
  },
  created() {
    this.fetchPokemonDetails(this.$route.params.pokemonId);
  },
};
</script>

<style scoped>
#card-details {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  padding: 2em 1em;
  margin: 2em;
  border-radius: 1em;
  border: 1px solid #cea5a3;
  box-shadow: 5px 5px 5px lightgray;
}

p {
  padding: 5px;
  font-size: large;
  color: #333;
  font-weight: 300;
}
h2 {
  color: #333;
  text-decoration: underline;
  text-decoration-color: #b93030;
}
</style>
