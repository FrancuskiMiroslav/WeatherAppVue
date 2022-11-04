# feChallenge

## Brief
Melbourne weather is not awesome. build a page that *is* awesome that reports the current weather at user's location.
The page should show these weather conditions for the current location with a toggle for celsius/farenheit:
```
 ┌───────────────────┐
 │ CURRENT WEATHER   │
 │ 22° C | CLOUDS    │
 │ KEW, AUSTRALIA    │
 │                   │
 │ HUMIDITY  73%     │
 │ WIND      6.2 M/S │
 │ SUNRISE   05:41   │
 │ SUNSET    20:06   │
 │                   │
 │ [c]|[f] (toggle)  │
 └───────────────────┘
```
Throw it in a Github Repo.

You can fetch the weather using a free API (details below, or use another if preferred). Get the current geo location using your preferred method (e.g. browser / ip lookup service). Fallbacks welcome.

As the API has a call limit the results should be locally cached (e.g. localstorage, cookie). When toggling c|f calculate the values instead of making another call.

Use Vue.js or simply pure JS... SCSS should be used for styling. The important thing is that the code is clean, consistent and crystal clear.

## API Details

Feel free to use any weather API. Here are some possible choices:

*OpenWeatherMap*
 - Grab an API key here: https://openweathermap.org/appid (free signup, 60 requests/min)
 - Docs: https://openweathermap.org/current
 - Example call: http://api.openweathermap.org/data/2.5/weather?lat=YOUR_LATITUDE&lon=YOUR_LONGITUDE&appid=YOU_API_KEY

*Other options*
 - **ClimaCell (Tomorrow)** - https://docs.tomorrow.io/reference/welcome  
 - **Aeris Weather** - https://www.aerisweather.com/develop/api/




# VueStarterPack

This template should help get you started developing with Vue 3 in Vite.

## Recommended IDE Setup

[VSCode](https://code.visualstudio.com/) + [Volar](https://marketplace.visualstudio.com/items?itemName=Vue.volar) (and disable Vetur) + [TypeScript Vue Plugin (Volar)](https://marketplace.visualstudio.com/items?itemName=Vue.vscode-typescript-vue-plugin).

## Customize configuration

See [Vite Configuration Reference](https://vitejs.dev/config/).

## Project Setup

```sh
npm install
```

## SCSS optional

```sh
# Sass
npm install -D sass-loader sass
npm install -g sass-migrator
```

### Compile and Hot-Reload for Development

```sh
npm run dev
```

### Compile and Minify for Production

```sh
npm run build
```


### deploy to gh-pages

```sh
npm run deploy
```