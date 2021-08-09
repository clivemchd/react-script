#!/bin/bash

printStart(){
    printf "\n"
    printf '\e[1;31m%-6s\e[m' "Initiating " $1
    printf "\n\n"
}

printEnd(){
    printf "\n"
    printf '\e[1;34m%-6s\e[m' "Completed " $1
    printf "\n\n"
}

printStart "new_folder";
mkdir react-boiler
cd react-boiler
printEnd "new_folder";

printStart "package.json";
npm init -y
printEnd "package.json";

printStart "Transpiler";
npm install --save babel-core babel-cli
npm install --save babel-preset-es2015 babel-preset-stage-0
printEnd "Transpiler";

printStart ".babelrc";
echo '{
    "presets": ["es2015", "stage-0"],
    "plugins": []
}' > .babelrc
cat .babelrc
printEnd ".babelrc";

printStart "eslint";
npm install --save-dev eslint
printEnd "eslint";

printStart "airbnb_guidelines";
npm install --save-dev eslint-config-airbnb
npm install --save-dev eslint-plugin-import
npm install --save-dev eslint-plugin-jsx-a11y
npm install --save-dev eslint-plugin-react
npm install --save-dev babel-eslint
printEnd "airbnb_guidelines";

printStart "eslint_config";
echo '{
  "extends": "airbnb",
  "env": {
    "es6": true,
    "browser": true,
    "node": true
  }
  "rules": {
    "react/jsx-filename-extension": 0,
    "react/forbid-prop-types": 0
  },
  "parser": "babel-eslint",
}' > .eslintrc
cat .eslintrc
printEnd "eslint_config";