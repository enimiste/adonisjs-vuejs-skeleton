#!/bin/bash
# node v8.*
echo "Installing required packages..."
ADONISJS_VERSION="4.0.5"
if [ ! -z $2 ]
then
ADONISJS_VERSION=$2
fi
echo "Installing : @adonisjs/cli@$ADONISJS_VERSION"

npm i -g @adonisjs/cli@$ADONISJS_VERSION
echo "Installing : package-json-merge"
npm i -g package-json-merge
echo "Installing : prettier-package-json"
npm i -g prettier-package-json

echo "Creating Adonisjs new project $1"
adonis new $1
cd $1
echo '_tmp' >> .gitignore

LARAVEL_VERSION="5.5.28"
if [ ! -z $3 ]
then
LARAVEL_VERSION=$3
fi
echo "Cloning Laravel $LARAVEL_VERSION skelton project"
git clone --depth=1 https://github.com/laravel/laravel -b $LARAVEL_VERSION _tmp
cp -r _tmp/resources/assets resources/
echo "Merging package.json files"
package-json-merge _tmp/package.json package.json > package.json.merged
mv package.json.merged package.json
prettier-package-json --write package.json
echo "Copying : webpack.mix.js"
cp _tmp/webpack.mix.js webpack.mix.js
echo 'mix.setPublicPath("public");' >> webpack.mix.js

echo "Remove Laravel template"
rm -rf _tmp
echo "Edge views : Layout, welcome"
curl https://raw.githubusercontent.com/enimiste/adonisjs-vuejs-skeleton/master/resources/views/layout.edge > resources/views/layout.edge
curl https://raw.githubusercontent.com/enimiste/adonisjs-vuejs-skeleton/master/resources/views/welcome.edge > resources/views/welcome.edge
echo "Installing project dependencies"
npm i

echo "Remove installed packages"
echo "Removing : @adonisjs/cli@$ADONISJS_VERSION"
npm i -g @adonisjs/cli@$ADONISJS_VERSION
echo "Removing : package-json-merge"
npm remove -g package-json-merge
echo "Removing : prettier-package-json"
npm remove -g prettier-package-json

echo "Checking : Generating js/css files"
npm run dev
echo 'You can open another cmd and run : npm run watch'
npm run start
