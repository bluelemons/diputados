# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_user do
    email 'admin@example.com'
    password 'password'
  end

#  factory :admin, class: AdminUser do
#    email "superadmin@example.com"
#    password "password"
##    p.association :roles, :factory => :admin
#  end

end
