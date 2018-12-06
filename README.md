The old app is still [available here](https://sprachspiel.herokuapp.com), based on the master branch.
The new app is [available here](https://sprachspiel-staging.herokuapp.com), but still under development and it is based on the staging branch.

An android application is available, this is the [github repository of the android application](https://github.com/fabriziobertoglio1987/sprachspiel-android), while the android package can be [downloaded here](https://s3.eu-central-1.amazonaws.com/sprachspiel/app-release.apk).

# Environment


```
Ruby 2.5.0
Rails 5.1 
```

# Installation instructions

```
git clone git@github.com:fabriziobertoglio1987/sprachspiel.git
cd sprachspiel
git checkout staging
rbenv local 2.5.0
bundle install
rails s
rails db:setup
```
you find the app at `localhost:3000`
