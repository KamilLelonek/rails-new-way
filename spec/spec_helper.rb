require 'json_spec'
require 'ffaker'
require 'solid_use_case/rspec_matchers'
require 'rspec/collection_matchers'

%w(shared support).each do |path|
  Dir["./spec/#{path}/**/*.rb"].sort.each &method(:require)
end

require_relative 'rails_helper'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.include SolidUseCase::RSpecMatchers
end
