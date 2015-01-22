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

Destination.create ([{city: 'Taipei', country: 'Taiwan', google_places_id: "ChIJ_S3NjSWZqTMRBzXT2wwDNEw"}, {city: 'London', country: 'United Kingdom', google_places_id: 'ChIJdd4hrwug2EcRmSrV3Vo6llI'}, {city: 'Paris', country: 'France', google_places_id: "ChIJD7fiBh9u5kcRYJSMaMOCCwQ"}, {city: 'Cebu', country: 'Philippines', google_places_id: "ChIJ_S3NjSWZqTMRBzXT2wwDNEw"}, {city: 'Madrid', country: 'Spain', google_places_id: "ChIJgTwKgJcpQg0RaSKMYcHeNsQ"}, {city: 'Barcelona', country: 'Spain', google_places_id: "ChIJ5TCOcRaYpBIRCmZHTz37sEQ"}, {city: 'Athens', country: 'Greece', google_places_id: "ChIJ8UNwBh-9oRQR3Y1mdkU1Nic"}, {city: 'Seoul', country: 'South Korea', google_places_id: "ChIJzWXFYYuifDUR64Pq5LTtioU"}, {city: 'Tokyo', country: 'Japan'}, {city: 'Manila', country: 'Philippines', google_places_id: "ChIJi8MeVwPKlzMRH8FpEHXV0Wk"}, {city: 'Heidelberg', country: 'Germany', google_places_id: "ChIJzdzMDgXBl0cR1zokRADq5u8"}, {city: 'Frankfurt', country: 'Germany', google_places_id: "ChIJxZZwR28JvUcRAMawKVBDIgQ"}, {city: 'Hamburg', country: 'Germany', google_places_id: "ChIJuRMYfoNhsUcRoDrWe_I9JgQ"}, {city: 'Bilbao', country: 'Spain', google_places_id: 'ChIJuYlLZidOTg0RRaaVHsSsNGU'}, {city: 'Cairo', country: 'Egypt', google_places_id: "ChIJz6gXkZ0QWBQRuaJt4gI9myY"}, {city: 'Alexandria', country: 'Egypt', google_places_id: "ChIJWZ62TNvE9RQRg7c5SPRCLeQ"}])

Activity.create ([{name: 'Diving', category: "Water Sports"}, {name: 'Surfing',  category: "Water Sports"}, {name: 'Beach Chillout', category: "Water Sports"}, {name: 'Trekking', category: "Outdoors"}, {name: 'Skiing', category: "Outdoors"}, {name: 'Snowboarding', category: "Outdoors"}, {name: 'Sightseeing', category: "Tourism/Leisure"}, {name: 'Food Trip', category: "Tourism/Leisure"}, {name: 'Bar and Nightlife', category: "Tourism/Leisure"}, {name: 'Shopping', category: "Tourism/Leisure"}, {name: 'Field Trip', category: "Educational"}, {name: 'Hackathon', category: "Educational"},{name: 'Study Group', category: "Educational"}, {name: 'Volunteer', category: "Volunteer"}, {name: 'Photography', category: "Hobbies/Interests"}, {name: 'Arts & Crafts', category: "Hobbies/Interests"}, {name: 'Illustration', category: "Hobbies/Interests"}, {name: 'Pilgrimage', category: "Religious"}, {name: 'Religious Site Visit', category: "Religious"}])

capacity = [nil,1,2,3,4,5,6,7,8,9,10]

(1..20).each do |exp_index|
  trip = Trip.create organizer: User.find(rand(1..10)), destination: Destination.find(rand(1..16)),
    activity: Activity.find(rand(1..19)),
    from_date: Date.today+(rand(1..5)),
    to_date: Date.today+(rand(6..10)),
    description: "This is Trip no. #{exp_index} created through seeds",
    capacity: capacity[rand(0..10)]
    puts trip.errors.messages
end
