require 'test_helper'

class FollowNotificationsControllerTest < ActionDispatch::IntegrationTest
  test "should get link_through" do
    get follow_notifications_link_through_url
    assert_response :success
  end

end
