require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest

  # test to ensure we can successful access the homepage / root path (url)
  test 'should get index' do
    get root_path
    assert_response :success
    assert_select "title"
  end

  # test to ensure we can successful access the help page path (url)
  test 'should get help' do
    get help_path
    assert_response :success
    assert_select "title"
  end

  # Here we adding about page using TDD, We try and check for about page which didnt exist, then we will write code to get a pass
  test 'should get about' do
    get about_path
    assert_response :success
    assert_select "title"
  end

  test 'should get contact' do
    get contact_path
    assert_response :success
    assert_select "title"
  end

  # here are the step to adding about
  # => we run the test and got this error while checking for about page. Note that the other two test has already passed, we had the code, we just test if we can assess their urls (paths) and it all passed. This time we want to use TDD to add about page. We got this error when we run the test after adding about

  # => NameError: undefined local variable or method `about_path'

  # This error message means rails code for about page url is undefines, this is a hit that we need to add about route to our route file. Let add this: 

  # => get '/about', to: 'pages#about'

  # We run the code again and got this error:

  # => The action 'about' could not be found for PagesController

  # This means we need to add about action / method in the pagesController file

  # => def about
  #    end

  # We run the code again and got this error:

  # => PagesController#about is missing a template for request formats: text/html

  # This means we missing a view tamplate for about action. So let create => about.html.erb file in the views=>pages folder. You can add anything you want, let add => <h2>About Us</h2>

  # We run the code again and all passed no errors.


  # =============================================================================

  # When should you use TDD and application code
  
  # When the test is especially short or simple compared to the application code, then lean toward writing the test first

  # When the desired behavior isn't yet crystal clear, lean toward writing the application code first, then write a test to verify the result




end