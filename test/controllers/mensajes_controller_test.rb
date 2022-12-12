require "test_helper"

class MensajesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get mensajes_new_url
    assert_response :success
  end

  test "should get index" do
    get mensajes_index_url
    assert_response :success
  end

  test "should get show" do
    get mensajes_show_url
    assert_response :success
  end

  test "should get edit" do
    get mensajes_edit_url
    assert_response :success
  end

  test "should get delete" do
    get mensajes_delete_url
    assert_response :success
  end
end
