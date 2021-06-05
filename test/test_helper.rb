# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  setup do
    @me = User.create!(email: "me@example.com", password: "password")
    @she = User.create!(email: "she@example.com", password: "password")
  end

  def github_mock
    return true
    # OmniAuth.config.test_mode = true
    # OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
    #   :provider => "github",
    #   :uid => "123456",
    #   :info => {
    #     :name => "bar",
    #     :email => "bar@example.com"
    #   }
    # }) 
    # request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]

    # @user = User.from_omniauth(request.env['omniauth.auth'])
  end
end
