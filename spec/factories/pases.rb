# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pase_a_computos, class: Pase do
    before(:create) do |pase  |
      pase.area = FactoryGirl.create(:computos)
    end
  end
end
