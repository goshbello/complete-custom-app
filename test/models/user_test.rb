require "test_helper"

class UserTest < ActiveSupport::TestCase

  # Here since we dont have any validation for the model yet, we will write a pass test first. Meaning we saying this is format we want every entry into the database should be

  def setup
    @user = User.new(name: "Example User", email: "user@bootcamp.com")
  end

  #if entry is like the above, then its valid
  test "should be valid" do
    assert @user.valid?
  end

  #test that name is presence
  test "name should be presence" do
    @user.name = " "  # means if user.name is empty
    assert_not @user.valid?  # assert_not, means return false
  end

  # when we run the above now.. the test will fail. to make it pass..we have to add validates :name, presence: true  => in the user model. Let do that new. Then run test again to get a pass

  #test that email is presence
  test "email should be presence" do
    @user.email = " "  # means if user.name is empty
    assert_not @user.valid?  # assert_not, means return false
  end

  # when we run the above now.. the test will fail. to make it pass..we have to add validates :email, presence: true  => in the user model. Let do that new. Then run test again to get a pass

  #test that name is presence. we want name to be 50 characters long
  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?  # assert_not, means return false
  end

  #test that email is presence. Email max length, we want 255
  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?  # assert_not, means return false
  end 

  #test to ensure that email is uniqueness. we will use email as username. so each user must have a unique email address. Note that we can only check this after user tried to save their entry
  test "email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower-case" do

  end 

end
