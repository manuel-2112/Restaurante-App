require "test_helper"

class AsksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get asks_new_url
    assert_response :success
  end

  test "should get index" do
    get asks_index_url
    assert_response :success
  end

  test "should get edit" do
    get asks_edit_url
    assert_response :success
  end
end
