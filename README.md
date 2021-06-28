# BeePoint Documentation
## V.1 => Made by Tomas Cantergiani

---

## Ruby version
- Ruby version 2.7.0

- Rails version 6.1.3.2


## Extra Gems Used:
- `gmaps4rails`
- `gon`
- `sidekiq`
- `dotenv-rails`
- `rubocop`
- `rubocop-performance`
- `rubocop-rails`
- `rubocop-rspec`
- `rspec-sidekiq`
- `rails-controller-testing`

## Database initialization
- `rails db:migrate`

## How to start the server:
- `bundle install`
- `yarn install`
- `rails db:migrate`
- `bundle exec sidekiq`
- `rails s`

## How to run the test suite
- First we have to  prepare the database: 
  - `rake db:migrate`
  - `rake db:test:prepare`
  - `rake db:test:load`
- Then we can run the tests with:
  - `bin/rails test`



## Services
- This app use sidekiq to run job asynchronously:
    - To execute the sidekiq server: `bundle exec sidekiq`
    -  We need to instal redis-server: apt install redis-server
 -  Google Maps API: this service permit the app to display a map.
    -  The app call the API, with this request:
       -  maps.google.com/maps/api/js?key=['API_KEY']
       -  API Key is store in .env file as `GMaps_Key`.
    - To use it e need to import the following libraries:
      - //cdn.rawgit.com/mahnunchik/markerclustererplus/master/dist/markerclusterer.min.js
      - //cdn.rawgit.com/printercu/google-maps-utility-library-v3-read-only/master/infobox/src/infobox_packed.js
      - //cdn.jsdelivr.net/gmaps4rails/2.1.2/gmaps4rails.js
      - //cdnjs.cloudflare.com/ajax/libs/underscore.js/1.8.3/underscore.js
  
## Deployment instructions:
- `TODO`

## Enviorenment Variables:
- `ZONE`: time zone of the aplication
- `GMaps_Key`: google maps API key.

## Clases:

- `Vehicle(identififier:String)`
  - Each Vehicle has many Waypoints.

- `Waypoint(longitude:Float, latitud:Float, sent_at:DateTime)`
  - Waypoints belongs to a particuclar Vehicle.


## Apps Upgrades for the Future:
- Change db to mysql
- Set as primary key of vehicles the identifier (it could be the id)
- sent_at could be and timestamp, to reduce the length from 8 to 4 bytes, but it would only work until the year 2038.
- Make lazy queries, to take less data in each query.
- Make more extensive testing with Rspec.
