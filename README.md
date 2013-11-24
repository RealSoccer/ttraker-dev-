TimeTracker
===============

Simple open source time tracking and report generation for companies and freelancers.

The app is running on Heroku:

[VISIT DEMO](http://ttracker-dev.herokuapp.com/)

## Installation

Depenencies:

- Ruby 1.9.3
- SQLite3
- Bundler

To install:

    $ git clone https://FHCEO@bitbucket.org/FHCEO/ttracker-dev.git
    $ cd TimeTracker
    $ gem install bundler
    $ bundle install
    $ rake db:create:all
    $ rake db:migrate

Finally, you can start the server:

    $ rails s

And then you can access the app by visiting [http://localhost:3000/](http://localhost:3000/)
username : vladimirusinov@gmail.com
password : password
