# Encoding: UTF-8

def create_visitor
  @visitor ||= { :name => "Testy", :last_name => "McUserton",
    :login => "alogin", :email => "example@example.com",
    :password => "password", :password_confirmation => "password" }
end

def find_user
  @user ||= AdminUser.where(:email => @visitor[:email]).first
end

def create_user factory = :admin_user
  create_visitor
  delete_user
  @user = FactoryGirl.create(factory, email: @visitor[:email])
end

def delete_user
  @user ||= AdminUser.where(:email => @visitor[:email]).first
  @user.destroy unless @user.nil?
end

def sign_up
  delete_user
  visit '/users/sign_up'
  fill_in "Name", :with => @visitor[:name]
  fill_in "Last name", :with => @visitor[:last_name]
  fill_in "Login", :with => @visitor[:login]
  fill_in "Email", :with => @visitor[:email]
  fill_in "Password", :with => @visitor[:password]
  fill_in "Password confirmation", :with => @visitor[:password_confirmation]
  click_button "Create"
  find_user
end

def sign_in
  visit '/backend/admin_users/sign_in'
  fill_in 'Email', :with => @visitor[:email]
  fill_in 'Contraseña', :with => @visitor[:password]
  click_button 'Login'
end

def sign_out
  visit '/backend/admin_users/sign_out'
end

### GIVEN ###
Given(/^I do not exist as a user$/) do
  create_visitor
  delete_user
end

Given(/^I exist as a user$/) do
  create_user
end

Given(/^I am not logged in$/) do
  sign_out
end

Given(/^I am logged in$/) do
  create_user
  sign_in
end

### WHEN ###
When /^I sign in with valid credentials$/ do
  create_visitor
  sign_in
end

When(/^I return to the site$/) do
  visit '/backend'
end

When(/^I sign in with a wrong login$/) do
  @visitor = @visitor.merge(:email => "wrong@example.com")
  sign_in
end

When(/^I sign in with a wrong password$/) do
  @visitor = @visitor.merge(:password => "wrongpass")
  sign_in
end

When(/^I sign out$/) do
  sign_out
end

### THEN ###
Then /^I should see an invalid login message$/ do
  page.should have_content "Email o contraseña inválidos."
end

Then /^I should be signed out$/ do
  page.should have_content "Conexión"
  page.should have_content "Email"
  page.should have_content "Contraseña"
end

Then(/^I see a successful sign in message$/) do
  page.should have_content "Iniciaste sesión correctamente."
end

Then(/^I should be signed in$/) do
  page.should have_content "Salir"
  page.should_not have_content "Sign up"
  page.should_not have_content "Login"
end
