#!/usr/bin/env sh


set -e


npm run build


cd dist


git init
git add -A
git commit -m 'new deploy'

git push -f git@github.com:leeoliima/poke-list-vue.git master:gh-pages

cd -