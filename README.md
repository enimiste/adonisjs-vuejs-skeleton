# Adonisjs + Vuejs Skeleton
To generate a fresh installation that uses Laravel v5.5.28 project template and Adonisjs 4.0.5 template see the file (Using Git Bash in Windows) : 

## Packages that will be installed globaly :
- `@adonisjs/cli@4.0.5` : To create a new Adonisjs project
- `package-json-merge` : To merge adonijs package.json file with one from Laravel temporary project
- `prettier-package-json` : To format the merged package.json file

# Requirements :
- Nodejs v8 or greater
- Git & Git Bash

# Installation Or Update:
## Windows :
Open Git Bash and run these commandes :
- `cd ~`
- `rm ./new-adonisjs-vuejs.sh` if exists
- `curl https://raw.githubusercontent.com/enimiste/adonisjs-vuejs-skeleton/master/new-adonisjs-vuejs.sh > ./new-adonisjs-vuejs.sh`

## Linux & Mac OS
Open a new commande line and run these commandes :
- `cd ~`
- `rm ./new-adonisjs-vuejs.sh` if exists
- `curl https://raw.githubusercontent.com/enimiste/adonisjs-vuejs-skeleton/master/new-adonisjs-vuejs.sh > ./new-adonisjs-vuejs.sh`
- `chmod +x ./new-adonisjs-vuejs.sh`
# Usage :
To create a project with name MY_PROJECT_NAME run this commande in your projects workspace : 
`~/new- adonisjs-vuejs.sh MY_PROJECT_NAME` 

The script support two more arguments after the project name :
- Adonis Cli Version (default to 4.0.5) 
- Laravel project version (default to v5.5.28). The v5.5.* is the last branch that uses Boostrap v3. To use Bootstrap v4 use v5.6.0 Or juste ignore this argument
`~/new- adonisjs-vuejs.sh MY_PROJECT_NAME ADONIS_VERSION LARAVEL_VERSION`  
Ex :
`~/new- adonisjs-vuejs.sh Blog 4.0.5 v5.5.28`  

NB : In Windows please use Git Bash commande line 
# License
None
NOUNI EL Bachir <nouni.elbachir@gmail.com>
