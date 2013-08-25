# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :computos, class: Area do
    name 'computos'
  end

  factory :area, class: Area do
    name 'area'
  end
end
