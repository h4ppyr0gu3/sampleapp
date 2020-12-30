require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
	
	def setup
    @base_title = "Ruby tutorial"
  end

  test "should get new" do
    get signup_url
    assert_response :success
  end

  test "should get signup" do
    get signup_url
    assert_response :success
    assert_select "title", "Sign up | #{@base_title}"
  end
end
