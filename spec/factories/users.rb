FactoryGirl.define do
  factory :user, aliases: [:organizer] do
    username "testuser"
    email "testuser@gmail.com"
    password "password"
    password_confirmation "password"
  end

end
