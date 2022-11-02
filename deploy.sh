#!/usr/bin/env sh

set -e

npm run build

cd dist

git init
git add -A
git commit -m 'new gh-pages deploy'
git push -f git@github.com:FrancuskiMiroslav/WeatherAppVue.git master:gh-pages

cd -