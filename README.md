The old app is still [available here](https://sprachspiel.herokuapp.com), based on the master branch.
The new app is [available here](https://sprachspiel-staging.herokuapp.com), but still under development and it is based on the staging branch.

An adroid application is available at 

# Environment

```
Ruby 2.3.3
Rails 5.1 
```

# Installation instructions

```
git clone git@github.com:fabriziobertoglio1987/sprachspiel.git
cd sprachspiel
git checkout staging
rbenv local 2.3.3
bundle install
rails s
rails db:setup
```
you find the app at `localhost:3000`
