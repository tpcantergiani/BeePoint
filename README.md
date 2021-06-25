# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
Ruby version 2.7.0

Rails version 6.1.3.2

* Database initialization
rails db:migrate

* How to start the server:
- bundle install
- rails db:migrate
- bundle exec sidekiq
- rails s

* How to run the test suite
- First we have to create some seeds with: rails db:seeds

* Services (job queues, cache servers, search engines, etc.)
This app use sidekiq to run job asynchronously
* Deployment instructions

* ...

Apps Upgrades for the Future:
- Change db to mysql
- Set as primary key of vehicles the identifier (it could be the id)
- sentAt could be and timestamp, to reduce the length from 8 to 4 bytes, but it would only work until the year 2038.

Clases:

Vehicle(Identififier:String)

Waypoint(Longitude:Float, Latitud:Float, sentAt:DateTime)

bundle exec sidekiq
