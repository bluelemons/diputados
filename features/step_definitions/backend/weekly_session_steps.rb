def create_session_type
  FactoryGirl.create :session_type
end

def new_weekly_session
  visit new_backend_weekly_session_path
end

def weekly_session_fill_form
  fill_in "Numero de sesion", with: "123456"
  fill_in "Numero de periodo", with: "123456"
  fill_in "Numero de reunion", with: "123456"
  select 'Ordinaria', :from => 'tipo de session'
  click_button "Crear Sesion"
end

Given(/^exits a session type$/) do
  create_session_type
end

When(/^I create an new weekly session$/) do
  new_weekly_session
  weekly_session_fill_form
end

Then(/^I should see the created weekly session$/) do
  page.should have_content "123456"
end
