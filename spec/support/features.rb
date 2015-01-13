RSpec.configure do |config|
  config.include Features::SessionHelpers, type: :feature
  config.include Features::TripFormHelpers, type: :feature

end
