# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

vehicle_1 = Vehicle.create(identifier: 'GWTF-98')
vehicle_2 = Vehicle.create(identifier: 'HA-3452')

atDate1 = DateTime.strptime("06/22/2021 09:00", "%m/%d/%Y %H:%M")
atDate2 = DateTime.strptime("06/20/2021 09:00", "%m/%d/%Y %H:%M")
atDate3 = DateTime.strptime("06/20/2021 09:01", "%m/%d/%Y %H:%M")

vehicle_1.waypoints.create!(latitude:11.0, longitude:11.0, sentAt: atDate1)
vehicle_1.waypoints.create!(latitude:12.0, longitude:12.0, sentAt: atDate2)

vehicle_2.waypoints.create!(latitude:9.0, longitude:9.0, sentAt: atDate3)
vehicle_2.waypoints.create!(latitude:10.0, longitude:10.0, sentAt: atDate1)
