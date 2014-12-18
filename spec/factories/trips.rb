FactoryGirl.define do
  factory :trip do
    user
    destination
    from_date Date.today+2
    to_date Date.today+3
    description "Excited to experience winter!"
    capacity 2
  end

end
