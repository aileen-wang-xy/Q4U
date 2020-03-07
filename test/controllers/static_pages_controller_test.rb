require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get requests" do
    get static_pages_requests_url
    assert_response :success
  end

  test "should get offers" do
    get static_pages_offers_url
    assert_response :success
  end

end
