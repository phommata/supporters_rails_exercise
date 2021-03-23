require "test_helper"

class PetitionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get petitions_index_url
    assert_response :success
  end
end
