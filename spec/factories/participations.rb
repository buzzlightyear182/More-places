FactoryGirl.define do
  factory :participation do
    user
    trip
    confirmed? true
  end
end
