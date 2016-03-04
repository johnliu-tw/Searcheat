require 'test_helper'

class SearcheatsControllerTest < ActionController::TestCase
  setup do
    @searcheat = searcheats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:searcheats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create searcheat" do
    assert_difference('Searcheat.count') do
      post :create, searcheat: { kind: @searcheat.kind, location: @searcheat.location, name: @searcheat.name, people: @searcheat.people, price: @searcheat.price }
    end

    assert_redirected_to searcheat_path(assigns(:searcheat))
  end

  test "should show searcheat" do
    get :show, id: @searcheat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @searcheat
    assert_response :success
  end

  test "should update searcheat" do
    patch :update, id: @searcheat, searcheat: { kind: @searcheat.kind, location: @searcheat.location, name: @searcheat.name, people: @searcheat.people, price: @searcheat.price }
    assert_redirected_to searcheat_path(assigns(:searcheat))
  end

  test "should destroy searcheat" do
    assert_difference('Searcheat.count', -1) do
      delete :destroy, id: @searcheat
    end

    assert_redirected_to searcheats_path
  end
end
