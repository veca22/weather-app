# README

## You can add and/or change cities in 'config/cities.yml'
## Instructions for staring weather app

### 1. Add .env variables to .env.development.local and to .env.test.local (The variables names are located in .env.development)
### 2. Run
    bundle install
### 3. Create and migrate db
    bundle exec rails db:create
    bundle exec rails db:migrate

## Instructions for staring tests
    bundle exec rails db:migrate RAILS_ENV=test
    bundle exec rspec ./spec

## APP tested in rails console with commands:
    bundle exec rails console
    app.get '/cities'
    app.get '/cities/sorted'
    app.post '/cities/average_temperatures', params: {'cities': ['Novi Sad', 'Barcelona'], 'start_interval': 20, 'end_interval': 39}

### Results with:
    app.response.body


