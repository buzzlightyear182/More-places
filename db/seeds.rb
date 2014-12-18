# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User.destroy_all
# Destination.destroy_all
# Activity.destroy_all

u = User.create username: 'buzzlightyear182', email: 'jane.buzzlightyear@gmail.com', password: 'password', password_confirmation: 'password'

(1..9).each do |user_index|
  user = User.create email:"email_0#{user_index}@gmail.com", username: "user0#{user_index}", password: "password0#{user_index}", password_confirmation: "password0#{user_index}"
end

Destination.create ([{name: 'Corsica'}, {name: 'Medellin'}, {name: 'Koyasan'}, {name: 'Maramures'}, {name: 'Haida Gwaii'}, {name: 'Oklahoma'}, {name: 'Tunis'}, {name: 'Choquequirao'}, {name: 'Sark'}, {name: 'Hyderabad'}, {name: 'Port Antonio'}, {name: 'Taipei'}, {name: 'Zermatt'}, {name: 'Presidio'}, {name: 'Mergui'}, {name: 'Sea Islands'}, {name: 'Mont St. Michel'}, {name: 'Esteros del Ibera'}, {name: 'National Mall'}, {name: 'Mornington Peninsula'}, {name: 'Faroe Islands'}, {name: 'London'}, {name: 'Paris'}, {name: 'Cebu'}, {name: 'Madrid'}, {name: 'Barcelona'}, {name: 'Athens'}, {name: 'Seoul'}, {name: 'Tokyo'}, {name: 'Manila'}, {name: 'Heidelberg'}])

Activity.create ([{name: 'Diving'}, {name: 'Trekking'}, {name: 'Surfing'}, {name: 'Beach Chillout'}, {name: 'Sightseeing'}, {name: 'Food Trip'}, {name: 'Skiing'}, {name: 'Shopping'}, {name: 'Educational'}, {name: 'Volunteer'}, {name: 'Photography'}, {name: 'Pilgrimage'}])

capacity = ["",1,2,3,4,5,6,7,8,9,10]

(1..30).each do |exp_index|
  experience = Experience.create user: User.find(rand(1..10)), destination: Destination.find(rand(1..31)), activity: Activity.find(rand(1..12)),
    from_date: Date.today+(rand(1..7)),
    to_date: Date.today+(rand(8..14)),
    description: "This is Trip no. #{exp_index} created through seeds",
    capacity: capacity[rand(0..10)]
    # puts experience.errors.messages
end
