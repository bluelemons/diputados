# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_user do
    email 'admin@example.com'
    password 'password'

    factory :backend do
      after(:create) do |user, evaluator|
        user.roles << FactoryGirl.create(:admin)
      end
    end

    factory :user_mesa_de_entrada do
      after(:create) do |user, evaluator|
        user.roles << FactoryGirl.create(:role_mesa_de_entrada)
      end
    end
  end
end
