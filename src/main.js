import { createApp } from 'vue'
import App from './App.vue'
import WeatherCard from './components/WeatherCard.vue'

import './assets/scss/main.scss'

const app = createApp(App)

app.component('weather-card', WeatherCard)

app.mount('#app')
