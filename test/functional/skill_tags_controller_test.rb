require 'test_helper'

class SkillTagsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:skill_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create skill_tag" do
    assert_difference('SkillTag.count') do
      post :create, :skill_tag => { }
    end

    assert_redirected_to skill_tag_path(assigns(:skill_tag))
  end

  test "should show skill_tag" do
    get :show, :id => skill_tags(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => skill_tags(:one).id
    assert_response :success
  end

  test "should update skill_tag" do
    put :update, :id => skill_tags(:one).id, :skill_tag => { }
    assert_redirected_to skill_tag_path(assigns(:skill_tag))
  end

  test "should destroy skill_tag" do
    assert_difference('SkillTag.count', -1) do
      delete :destroy, :id => skill_tags(:one).id
    end

    assert_redirected_to skill_tags_path
  end
end
