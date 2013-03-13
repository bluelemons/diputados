# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :dictaman, :class => 'Dictamen' do
    cuerpo "MyText"
    pase nil
  end
end
