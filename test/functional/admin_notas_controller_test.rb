require 'test_helper'

class Admin::NotasControllerTest < ActionController::TestCase

  setup do
    @nota = notas(:despacho)
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in admin_users(:admin)
  end

  test "should show index" do
    get :index
    assert_response :success
  end

  test "should show detalles" do
    get :show, id: @nota
    assert_response :success
  end

  test "should show new" do
    get :new
    assert_response :success
    pending "Deberia fijarse que el form pida un pase inicial."
  end

  test "should show edit" do
    get :edit, id: @nota
    assert_response :success
  end

  test "new form has expected elements" do
    get :new
    assert_select "form[id=new_nota][action=/admin/notas]" do
      assert_select "#nota_fojas", :count => 1
      assert_select "#nota_iniciador_id", :count => 1
      assert_select "#nota_pases_attributes_0_area_id", :count => 1
      assert_select "#nota_pases_attributes_0_ingreso", :count => 1
      assert_select "#nota_pases_attributes_0_descripcion", :count => 1
    end
  end

  test "show view must show a link to create a new Pase" do
    pending
  end

end
