require 'cucumber/rails'
require 'capybara/poltergeist'


Capybara.configure do |config|
  config.javascript_driver =:poltergeist
  config.default_wait_time = 5
  config.match = :one
  config.exact_options = true
  config.ignore_hidden_elements = true
  config.visible_text_only = true
  config.default_selector = :css
end

# Capybara.javascript_driver = :selenium

# Capybara.register_driver :poltergeist do |app|
#  Capybara::Poltergeist::Driver.new(app, {phantomjs: "/usr/local/bin/phantomjs", js_errors: true, timeout: 5, debug: true})
# end

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Cucumber::Rails::Database.javascript_strategy = :truncation

