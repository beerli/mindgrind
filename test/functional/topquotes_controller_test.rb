require 'test_helper'

class TopquotesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:topquotes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create topquote" do
    assert_difference('Topquote.count') do
      post :create, :topquote => { }
    end

    assert_redirected_to topquote_path(assigns(:topquote))
  end

  test "should show topquote" do
    get :show, :id => topquotes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => topquotes(:one).to_param
    assert_response :success
  end

  test "should update topquote" do
    put :update, :id => topquotes(:one).to_param, :topquote => { }
    assert_redirected_to topquote_path(assigns(:topquote))
  end

  test "should destroy topquote" do
    assert_difference('Topquote.count', -1) do
      delete :destroy, :id => topquotes(:one).to_param
    end

    assert_redirected_to topquotes_path
  end
end
