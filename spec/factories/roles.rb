# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin, class: Role do
    name "admin"
  end
  factory :role_mesa_de_entrada, class: Role do
    name "mesa_de_entrada"
  end
end
