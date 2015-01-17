FactoryGirl.define do
  factory :trip do
    organizer
    destination
    activity
    from_date Date.today+2
    to_date Date.today+5
    description "Excited to feel winter!"
    capacity 3
  end

end
