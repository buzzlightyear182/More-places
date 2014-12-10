RSpec.configure do |config|

  # Clean up and initialize database before
  # running test exmaples
  config.before(:suite) do
    # Truncate database to clean up garbage from
    # interrupted or badly written examplesconfig.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before type: :integration do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
    # Capybara.reset_sessions!
  end

end
