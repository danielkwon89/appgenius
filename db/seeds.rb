# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

5.times do
    Genius.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.unique.email, password: "password")

    pitch = Genius.last.pitches.build(title: Faker::Games::LeagueOfLegends.unique.quote, description: Faker::Quote.unique.matz, funding_start_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now), funding_end_date: Faker::Time.forward(days: 30, period: :morning), total_funding: 0, funding_goal: Faker::Number.between(from: 10000, to: 10000000), category: Faker::Book.genre)

    pitch.save

    Angel.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.unique.email, password: "password")
end