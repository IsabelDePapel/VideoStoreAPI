require 'simplecov'
SimpleCov.start 'rails' do
  add_filter "/mailers/"
  add_filter "/jobs/"
  add_filter "/channels/"
end
ENV["RAILS_ENV"] = "test"

require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/reporters"  # for Colorized output
require "minitest/rails"

#  For colorful output!
Minitest::Reporters.use!(
 Minitest::Reporters::SpecReporter.new,
 ENV,
 Minitest.backtrace_filter
)

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...
end
