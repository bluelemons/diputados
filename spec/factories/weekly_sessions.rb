# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :weekly_session do
    numero_de_sesion 1
    numero_de_periodo 1
    session_type nil
    area nil
    numero_de_reunion 1
  end
end
