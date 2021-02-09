require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest

	def setup
		@user = users(:david)
	end

	test "login with invalid information" do
		get login_path
		post login_path, params: { session: { email: "", password: "" } }
		assert_redirected_to login_path
		assert_not flash.empty?
		
		get root_path
		get root_path

		assert flash.empty?
	end

	test "login with valid information" do
		user = User.create!(name: "abc", email: "test@test.com", password: "test123")

		get login_path 
		post login_path, params: { session: { email: user.email, password: "test123"} }
		assert_redirected_to user_path(user)
		follow_redirect!
		assert_template  'users/show'
		assert_select "a[href=?]", login_path, count: 0
		assert_select "a[href=?]", logout_path
		assert_select "a[href=?]", user_path(user)
	end

	test "valid login followed by logout" do
		user = User.create!(name: "abc", email: "test@test.com", password: "test123")
		get login_path
		post login_path, params: { session: { email: user.email, password: "test123"} }
		assert_redirected_to user_path(user)
		follow_redirect!
		assert_template  'users/show'
		assert_select "a[href=?]", login_path, count: 0
		assert_select "a[href=?]", logout_path
		assert_select "a[href=?]", user_path(user)
		delete logout_path
		assert_not is_logged_in?
		assert_redirected_to root_path
		delete logout_path
		follow_redirect!
		assert_select "a[href=?]", login_path
		assert_select "a[href=?]", logout_path, count: 0
		assert_select "a[href=?]", user_path(user), count:0
	end

	test "login and remember" do
		user = User.create!(name: "abc", email: "test@test.com", password: "test123")
		log_in_as(user, remember_me: '1')
		assert_not_nil cookies['remember_token']
	end

	test "login without remember" do
		user = User.create!(name: "abc", email: "test@test.com", password: "test123")

		log_in_as(user, remember_me: '0')
		assert_nil cookies['remember_token']
	end 

end
