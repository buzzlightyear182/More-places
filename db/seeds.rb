# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.create username: 'buzzlightyear182', email: 'jane.buzzlightyear@gmail.com', password: 'password', password_confirmation: 'password'

(1..5).each do |user_index|
  User.create email:"email-#{user_index}@gmail.com", username: "user0#{user_index}", password: "pwd00#{user_index}", password_confirmation: "pwd00#{user_index}"
end
