require 'test_helper'

class Admins::AdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admins_admins_new_url
    assert_response :success
  end

end
