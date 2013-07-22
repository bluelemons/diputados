def new_notas
  visit new_backend_nota_path
end

def notas_fill_form
  fill_in "Numero", with: "1221"
  fill_in "Iniciador", with: "Some One"
  select 'computos', :from => 'Area'

  click_button "Crear Nota"
end

When(/^I create an new nota$/) do
  new_notas
  notas_fill_form
end

Then(/^I should see the created nota$/) do
  page.should have_content "1221"
  page.should have_content "Some One"
end
