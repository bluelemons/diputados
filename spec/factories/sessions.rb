# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :session do
    fecha "2013-03-10"
    numero_de_periodo 1
    pase nil
  end
end
