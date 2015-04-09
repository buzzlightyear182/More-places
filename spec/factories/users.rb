FactoryGirl.define do

  factory :user, aliases: [:organizer] do
    username "testuser"
    sequence(:email) { |n| "username_#{n}@example.com" }
    password "password"
    password_confirmation "password"

    trait :participant do
      username "joiner"
    end

    trait :author do
      username "reviewer"
    end

    trait :second_participant do
      username "second"
    end

    factory :participant, traits: [:participant]
    factory :author, traits: [:author]
    factory :second_participant, traits: [:second_participant]

  end

end
