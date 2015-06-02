require 'test_helper'

class UrlsControllerTest < ActionController::TestCase
  setup do
    @url = FactoryGirl.create :url
  end

  test "should add short url when saving" do
    assert_difference('Url.count') do
      post :create, url: { long: @url.long }
    end
    assert Url.last.short
  end
  
  test "should redirect to long url when get is called" do
    get :show, id: @url
    assert_redirected_to @url.long
  end


  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:urls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create url" do
    assert_difference('Url.count') do
      post :create, url: { long: @url.long, short: @url.short, user_id: @url.user_id, visit_counter: @url.visit_counter }
    end

    assert_redirected_to url_path(assigns(:url))
  end
  
  test "should get edit" do
    get :edit, id: @url
    assert_response :success
  end

  test "should update url" do
    patch :update, id: @url, url: { long: @url.long, short: @url.short, user_id: @url.user_id, visit_counter: @url.visit_counter }
    assert_redirected_to url_path(assigns(:url))
  end

  test "should destroy url" do
    assert_difference('Url.count', -1) do
      delete :destroy, id: @url
    end

    assert_redirected_to urls_path
  end
end
