# Has Many Talks

## Instructions for Heroku

* `heroku config:set JOINDIN_API_ENDPOINT=http://api.joind.in/v2.1`
* `heroku run rails db:create`
* `heroku run rails db:migrate`
* `heroku pg:psql` then:
    * `\c dffjdvqgccfttr` or the current heroku database name
    * `\copy locations (city, state, created_at, updated_at) from db/data/cities.tsv`
    * `\q`
* `heroku run rails seed:conferences_joindin_data`


## Instructions for Local Development

Run from the root folder of your project:

* `bundle install`
* `rails db:create`
* `rails db:migrate`
* Run the following replacing `<my_user>` with your postgresql username:
    * `psql -h localhost -d has-many-talks_development -U <my_user> -c "\copy locations (city, state, created_at, updated_at) from $(pwd)/db/data/cities.tsv"`
* `rails seed:conferences_joindin_data`
* `rails s` runs on [localhost:3000](http://localhost:3000)
