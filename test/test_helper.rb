require 'simplecov'
SimpleCov.start 'rails'

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionController::TestCase
  include Devise::TestHelpers

  def stub_ability
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    @controller.instance_variable_set("@current_ability", @ability)
  end

  def stub_permisive_ability
    stub_ability
    @ability.can :manage, :all
  end

  def login_as role
    @request.env["devise.mapping"] = Devise.mappings[role]
    sign_in admin_users(role)
  end
end

