require "test_helper"

class SiteLayoutLinksTest < ActionDispatch::IntegrationTest

  # When we run this text it will check if all the links of our website are working and they redirect user to the correct pages.

  test "layout links" do
    get root_path
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", news_path
    assert true
  end
end

# assert_select "a[href=?]", about_path  ==> This will be translated as <a href=/about>About</a>, rails will replace the "?" with the routes name. in this case it is "/about"