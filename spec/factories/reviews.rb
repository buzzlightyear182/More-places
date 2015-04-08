FactoryGirl.define do
  factory :review do
    participation
    participant
    content "This is a review"
    score 10
  end

end
