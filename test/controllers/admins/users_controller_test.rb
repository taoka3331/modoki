require 'test_helper'

class Admins::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admins_users_new_url
    assert_response :success
  end

end
