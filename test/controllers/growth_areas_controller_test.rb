require 'test_helper'

class GrowthAreasControllerTest < ActionController::TestCase
  setup do
    @growth_area = growth_areas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:growth_areas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create growth_area" do
    assert_difference('GrowthArea.count') do
      post :create, growth_area: { title: @growth_area.title }
    end

    assert_redirected_to growth_area_path(assigns(:growth_area))
  end

  test "should show growth_area" do
    get :show, id: @growth_area
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @growth_area
    assert_response :success
  end

  test "should update growth_area" do
    patch :update, id: @growth_area, growth_area: { title: @growth_area.title }
    assert_redirected_to growth_area_path(assigns(:growth_area))
  end

  test "should destroy growth_area" do
    assert_difference('GrowthArea.count', -1) do
      delete :destroy, id: @growth_area
    end

    assert_redirected_to growth_areas_path
  end
end
