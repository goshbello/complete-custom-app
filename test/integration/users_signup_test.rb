require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest

  # Test to check if signup was successful
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: {
        name: " ",
        email: "user@invalid",
        password: "pass",
        password_confirmation: "pass"
      }
      }
    end
    assert_template 'users/new'  #keep getting error from this line
  end

  # Test to check if signup was successful
  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: {
        name: "Example User",
        email: "user@example.com",
        password: "password123",
        password_confirmation: "password123"
      }
      }
    end
    follow_redirect!
    assert_template 'users/show'  #keep getting error from this line
    # assert_not flash.FILL_IN
    assert is_logged_in?
  end
  
end
