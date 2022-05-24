class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #if information entered by user passes validation, then we call the log_in method we created in in the session helper file, then pass in the user variable, who has just logged in as the argument to the log_in method, we the method can save the user's id in a secured cookies
      log_in user
      redirect_to user # then we redirect the user to his/her profile page
    else
     flash.now[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
