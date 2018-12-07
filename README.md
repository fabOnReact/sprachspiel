SprachSpiel 2.0 is [available here](https://sprachspiel-staging.herokuapp.com), but still under active development.

SprachSpiel Android Application can be [downloaded here](https://s3.eu-central-1.amazonaws.com/sprachspiel/app-release.apk), while this is the [android Application github repository](https://github.com/fabriziobertoglio1987/sprachspiel-android)

# Environment

```
Ruby 2.5.0
Rails 5.1 
```

# Installation instructions

```
git clone git@github.com:fabriziobertoglio1987/sprachspiel.git
cd sprachspiel
rbenv local 2.5.0
bundle install
rails s
rails db:setup
```
you find the app at `localhost:3000`
