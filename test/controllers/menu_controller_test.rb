require 'test_helper'

class MenuControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get menu_index_url
    assert_response :success
  end

  test "should get new" do
    get menu_new_url
    assert_response :success
  end

end
