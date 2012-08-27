require 'test_helper'

class AdminUserTest < ActiveSupport::TestCase
  test "el mail del usuario" do
    user = AdminUser.new
    assert !user.save, "el usuario debe tener un mail"
    user.email = "admin@example.com"
    assert !user.save, "el usuario debe tener una password"
    user.password = "qwerty3"
    assert !user.save, "el email no puede estar repetido"
    user.email = "admin2@example.com"
  end
end
