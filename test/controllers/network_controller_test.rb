require "test_helper"

class NetworkControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get network_index_url
    assert_response :success
  end
end
