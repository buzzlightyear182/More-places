FactoryGirl.define do
  factory :user do
    username "testuser"
    email "testuser@gmail.com"
    password "password"
    password_confirmation "password"
  end

end
