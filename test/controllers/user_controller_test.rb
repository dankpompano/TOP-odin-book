require_relative "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  #
  test "should get new" do
    get users_path
    assert_response :success
  end
end
