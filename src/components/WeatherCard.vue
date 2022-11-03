<template >
    <div class="weather-card">
        <picture class="weather-card__bg" >
                  <!-- mobile image -->
                  <source
                  srcset="https://picsum.photos/390/300"
                  media="all and (max-width:576px)"
                  >
                  <!-- tablet small image -->
                  <source
                  srcset="https://picsum.photos/354/420"
                  media="all and (min-width:577px) and (max-width:990px)"
                  >
                  <!-- tablet image -->
                  <source
                  srcset="https://picsum.photos/462/420"
                  media="all and (min-width:991px) and (max-width:1199px)"
                  >
                  <!-- desktop image -->
                  <source
                  srcset="https://picsum.photos/900/420"
                  media="all and (min-width:1200px)"
                  >
                  <!-- default image as a fallback -->
                  <img src="https://picsum.photos/900/420"
                  alt="Alt"
                  loading="eager">
        </picture>
        <div>
            <p>
                Current Weather
            </p>
        </div>
        
        <div class="weather-card__info">           
            <h3 class="weather-card__country-name">
                {{ countryName }},
            </h3>
            <h3 class="weather-card__city-name">
                {{ cityName }}
            </h3>

            <h3 class="weather-card__temp">
                <span v-if="toggleTemperatureScale">
                    {{ getCelsiusTemp }} &#8451;
                </span>

                <span v-else>
                    {{ getFahrenheitTemp }} &#8457;
                </span>
            </h3>
        </div>

        <ul class="weather-card__clouds">
            <li> {{ cloudDesc }}</li>
            <li>
                <img v-bind:src="(`http://openweathermap.org/img/wn/${cloudIcon}@2x.png`)" alt="clouds">
            </li>
        </ul>

        <ul class="weather-card__rest-info">
            <li>
                humidity: {{ humidity }}%
            </li>
            <li>
                wind: {{ wind }} m/s
            </li>
            <li>
                sunrise: {{ sunrise }}
            </li>
            <li>
                snuset: {{ sunset }}
            </li>
        </ul>

        <button class="toggleTemp button" @click="toggleTemp">{{ toggleTemperatureScale ? 'Display Farenheit' : 'Display Celsius' }}</button>
    </div>
</template>

<script>
export default {
    props: {
        weather: Object
    },

    data() {
        return {
            cityName: this.weather.name,
            cloudId: Number,
            cloudDesc: '',
            cloudIcon: '',
            countryName: this.weather.sys.country,
            humidity: this.weather.main.humidity,
            wind: this.weather.wind.speed,
            sunrise: this.weather.sys.sunrise,
            sunset: this.weather.sys.sunset,
            toggleTemperatureScale: true,
        }
    },

    methods: {
        getClouds() {
            this.cloudId = this.weather.weather[0].id,
                this.cloudDesc = this.weather.weather[0].description,
                this.cloudIcon = this.weather.weather[0].icon
        },

        getSunriseTime() {
            let sunrise = new Date(this.sunrise * 1000);

            this.sunrise = sunrise.toLocaleTimeString("default");
        },

        getSunsetTime() {
            let sunset = new Date(this.sunset * 1000);

            this.sunset = sunset.toLocaleTimeString("default");
        },

        toggleTemp() {
            this.toggleTemperatureScale = !this.toggleTemperatureScale;
        },
    },

    computed: {
        getCelsiusTemp() {
            return Math.floor(Object.values(this.weather.main)[0])
        },

        getFahrenheitTemp() {
            return Math.floor((Object.values(this.weather.main)[0] * (9 / 5) + 32));
        },
    },

    mounted() {
        this.getClouds();
        this.getSunriseTime();
        this.getSunsetTime();
    }
}
</script>

<style scoped lang="scss">
.weather-card {
    width: 100%;
    max-width: 500px;
    margin: 0 auto;
    padding-block: 20px;
    padding-top: 0;
    display: flex;
    flex-direction: column;
    align-items: center;
    text-transform: uppercase;
    border: 1px solid #253746;
    position: relative;
    color: #ffffff;
    z-index: 5;

    &::before {
        content: "";
        position: absolute;
        inset: 0;
        background-color: rgba($color: #253746, $alpha: 0.8);
        z-index: 0;
    }

    &__bg {
        width: 100vw;
        height: 100%;
        position: absolute;
        z-index: -5;
        img {
            position: absolute;
            inset: 0;
            width: 100%;
        }
    }

    ul, div {
        position: relative;
    }

    &__info {
        position: relative;
        width: 100%;
        display: flex;
        gap: 10px;
        padding: 20px;
        justify-content: center;
        align-items: center;
    }

    &__clouds {
        display: flex;
        flex-direction: column;
        width: 100%;
        justify-content: center;
        align-items: center;

        img {
            object-fit: contain;
            width: 100%;
            max-width: 150px;
        }
    }

    &__rest-info {
        display: flex;
        flex-direction: column;
        gap: 12px;
        margin-bottom: 20px;
    }
}
</style>