FactoryGirl.define do
  factory :experience do
    user
    destination
    activity
    from_date Date.today+2
    to_date Date.today+5
    description "Excited to experience winter!"
    capacity 3
  end

end
