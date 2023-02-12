require "test_helper"

class Admin::FishControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_fish_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_fish_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_fish_create_url
    assert_response :success
  end

  test "should get show" do
    get admin_fish_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_fish_edit_url
    assert_response :success
  end
end
