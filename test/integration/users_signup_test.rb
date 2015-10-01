require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "invalid signup information" do
    get signup_path
    skip
    assert_no_difference 'User.count' do
      post user_path, user: { name: "", 
                            email: "test@invalid",
                            password:              "foo",
                            password_confirmation: "far"}
    end
    assert_template 'users/new'
  end
  
  test "valid signup information" do
    get signup_path
    skip
    assert_difference 'User.count', 1 do
      post_via_redirect user_path, user: { name: "Example User", 
                                         email: "test@example.com",
                                         password:              "strongpassword",
                                         password_confirmation: "strongpassword"}
    end
    assert_template 'users/show'
    asssert is_logged_in?
  end
  
end
