require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest

	test "invalid signup information" do 
		get	new_user_path
		assert_no_difference 'User.count' do
			post users_path, params: { user: { name: "",
																					email: "user@invalid",
																					password: "foo",
																					password_confirmation: "bar"} }
		end
		assert_redirected_to new_user_path
	end

	test "valid signup information" do
		get new_user_path
		assert_difference 'User.count', 1 do
			post "/users", params: { user: {  name: "Example User",
                                		  		email: "user@example.com",
																	  			password: "foobar",
																		  		password_confirmation: "foobar"} }
		end
		assert_redirected_to user_path(User.last)
		assert_not flash.empty?
		assert is_logged_in?
	end
end
