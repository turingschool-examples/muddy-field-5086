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
universal_studios = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

universal_studios.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

mechanic1 = Mechanic.create!(name: 'Alice Johnson', years_experience: 10)
mechanic2 = Mechanic.create!(name: 'Bob Smith', years_experience: 15)

mechanic1.rides << Ride.find_by(name: 'The Hurler')
mechanic1.rides << Ride.find_by(name: 'The Scrambler')
mechanic2.rides << Ride.find_by(name: 'Jaws')
