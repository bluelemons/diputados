require 'test_helper'

class Admin::NotasControllerTest < ActionController::TestCase

  setup do
    @nota = notas(:despacho)
    login_as :admin
  end

  test "should show index" do
    get :index
    assert_response :success
  end

  test "should show detalles" do
    get :show, id: @nota
    assert_equal(@nota.id, assigns(:nota).id)
    assert_response :success
    assert_template :show
  end

  test "should show new" do
    get :new
    assert_response :success
  end

  test "should show edit" do
    get :edit, id: @nota
    assert_response :success
  end

  test "should create nota" do
     pending
  end

  test "should destroy nota" do
     pending
  end

  test "Index view should show a table with notas" do
    get :index
    assert_select "table#notas", :count => 1
  end

  test "Index view should have a form to filter data" do
    get :index
    assert_select "form[action=/admin/notas]", :count => 1
  end

  test "new form has expected elements" do
    get :new
    assert_select "form[id=new_nota]" do
      assert_select "#nota_fojas", :count => 1
      assert_select "#nota_pases_attributes_0_area_id", :count => 1
      assert_select "#nota_pases_attributes_0_ingreso", :count => 1
      assert_select "#nota_pases_attributes_0_descripcion", :count => 1
    end
  end

  test "edit form should not alow to edit Pase " do
    get :edit, id: @nota
    pending "the new and edit form should be different."
  end

  test "show view must show a form to create a new Pase" do
    get :show, id: @nota
    assert_select "form[id=new_pase]", :count => 1
  end

end
