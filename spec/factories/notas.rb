# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :nota, class: Nota do
    after(:build) do |nota|
      nota.pases << FactoryGirl.build(:pase)
    end
  end
end
