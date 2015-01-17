FactoryGirl.define do
  factory :user, aliases: [:organizer] do
    username "testuser"
    sequence(:email) { |n| "username_#{n}@example.com" }
    password "password"
    password_confirmation "password"
  end

end
