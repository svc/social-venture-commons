require 'test_helper'

class NeedsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:needs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create need" do
    assert_difference('Need.count') do
      post :create, :need => { }
    end

    assert_redirected_to need_path(assigns(:need))
  end

  test "should show need" do
    get :show, :id => needs(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => needs(:one).id
    assert_response :success
  end

  test "should update need" do
    put :update, :id => needs(:one).id, :need => { }
    assert_redirected_to need_path(assigns(:need))
  end

  test "should destroy need" do
    assert_difference('Need.count', -1) do
      delete :destroy, :id => needs(:one).id
    end

    assert_redirected_to needs_path
  end
end
