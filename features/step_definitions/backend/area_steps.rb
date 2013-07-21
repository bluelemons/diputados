def new_area
  visit new_backend_area_path
end

def fill_form
  fill_in "Nombre", with: "New Area"
  click_button "Crear Area"
end

When(/^I create an new area$/) do
  new_area
  fill_form
end

Then(/^I should see the created area$/) do
  page.should have_content "New Area"
end

