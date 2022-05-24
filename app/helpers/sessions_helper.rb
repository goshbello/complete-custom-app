module SessionsHelper

  # First we create a method that saved the new login user's id and create a secure encrypted cookies. This cookies is placed in the users browser
  def log_in(user)
    session[:user_id] = user.id
  end

  # for the current logged in user to be able to browser the site / application without beign as to login, we will create another method call "current_user". we will use this method to get the id of the user currently logged in from the cookies, or if there is no id, then will get that user's id from the database. this means, the user can keep browsing without needing to provide email and password
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  # The method below checks of user has logged in, and there is a currect_user
  def logged_in?
    !current_user.nil? # this mean current_user must exist
  end

  # Logout current user
  def log_out
    session.delete(:user_id)
    @currect_user = nil
  end
end
