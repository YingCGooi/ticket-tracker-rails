### Ticket Tracker

Ruby version: 2.3.1

#### Installation
`cd` to the project directory and run `bundle install` to install dependencies (note: you need to have Ruby 2.3.1 installed)

Run `rake db:migrate` to initialize database schema for the application to work properly on a local machine.

If running on a local machine, run `rails server` and navigate to `localhost:3000`.

Alternatively, you may try out the deployed version in heroku: 
https://ticket-tracker-rails.herokuapp.com/

#### Technologies
- Rails 5
- ERB for view templates
- CSS (flexbox used, no frameworks)
- SQLite3 as RDBMS
