# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
AmusementPark.destroy_all
Ride.destroy_all

six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

hurler = six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
scrambler = six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
ferris = six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

jaws = universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

mechanic1 = Mechanic.create!(name: "Johny", years_experience: 10)
mechanic2 = Mechanic.create!(name: "Billy", years_experience: 5)

ride1 = universal.rides.create!(name: "Crazy Monkey", thrill_rating: 10, open: true)
ride2 = universal.rides.create!(name: "Rocket", thrill_rating: 9, open: true)
ride3 = universal.rides.create!(name: "Something Good", thrill_rating: 13, open: false)
ride4 = six_flags.rides.create!(name: "Death from Above", thrill_rating: 15, open: true)
ride5 = six_flags.rides.create!(name: "The Hurler", thrill_rating: 7, open: false)

mechanic_ride1 = MechanicRide.create!(mechanic: mechanic1, ride: ride1)
mechanic_ride2 = MechanicRide.create!(mechanic: mechanic1, ride: ride2)
mechanic_ride3 = MechanicRide.create!(mechanic: mechanic1, ride: ride3)
mechanic_ride4 = MechanicRide.create!(mechanic: mechanic2, ride: ride4)
mechanic_ride5 = MechanicRide.create!(mechanic: mechanic2, ride: ride5)
mechanic_ride6 = MechanicRide.create!(mechanic: mechanic1, ride: ride4)