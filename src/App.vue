<template>
  <section>
    <header>
      <h1>
        WeatherAppVue
      </h1>
    </header>
    <weather-card v-if="!isFetching" v-bind:weather="weather" v-cloak></weather-card>   
  </section>
</template>

<script>
export default {
  data () {
    return {
      api_key: '04afd98c4d235fb8ba117d5701f7ecf3',
      url_base: 'https://api.openweathermap.org/data/2.5/',
      weather: {},
      isFetching: true,
    }
  },
  methods: {
    fetchWeaterData() {
      navigator.geolocation.getCurrentPosition((success, error) => {
        let {latitude, longitude} = success.coords
        
        fetch(`${this.url_base}/weather?lat=${latitude}&lon=${longitude}&appid=${this.api_key}&units=metric`)
        .then((resp) => {
        if (!resp.ok) {
          throw new Error(`${resp.statusText} - ${resp.url}`);
        }
          return resp.json();
        })
        .then(this.populateWeaterResults)
        .catch((err) => console.log(`-- ${err} on getting API call --`));
      })
    },

    populateWeaterResults(results) {    
      this.weather = results
      console.log(this.weather, results)

      this.handleLocalStorage()
      this.isFetching = false
    },

    handleLocalStorage() {
      localStorage.setItem('weather', JSON.stringify(this.weather))
    },
  },

  mounted() {
    this.fetchWeaterData()

    if (localStorage.weather) {
      this.weather = JSON.parse(localStorage.getItem('weather') || '{}'); 
    }
  },
}

</script>

<style scoped>

</style>