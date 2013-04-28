FactoryGirl.define do
  factory :pase do
    area
    ingreso { 2.days.ago }
  end
end
