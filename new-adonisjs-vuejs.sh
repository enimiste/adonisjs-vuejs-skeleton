# node v8.*
echo "Installing required packages..."
echo "Installing : @adonisjs/cli"
npm i -g @adonisjs/cli
echo "Installing : package-json-merge"
npm i -g package-json-merge
echo "Installing : prettier-package-json"
npm i -g prettier-package-json

echo "Creating Adonisjs new project $1"
adonis new $1
cd $1
echo 'tmp' >> .gitignore
echo "Cloning Laravel latest skelton project"
git clone --depth=1 https://github.com/laravel/laravel tmp
cp -r tmp/resources/assets resources/
echo "Merging package.json files"
package-json-merge tmp/package.json package.json > package.json.merged
mv package.json.merged package.json
prettier-package-json --write package.json
echo "Copying : webpack.mix.js"
cp tmp/webpack.mix.js webpack.mix.js
echo 'mix.setPublicPath("public");' >> webpack.mix.js

echo "Remove Laravel template"
rm -rf tmp
echo "Installing project dependencies"
npm i

echo "Checking : Generating js/css files"
npm run dev