FactoryGirl.define do
  factory :review do
    joiner
    participant
    content "This is a review"
    score 10
  end

end
