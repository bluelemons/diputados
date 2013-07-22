Given(/^an? (.*) exists$/) do |model|
  FactoryGirl.create model.sub(' ', '_').to_sym
end
