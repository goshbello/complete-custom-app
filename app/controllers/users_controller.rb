class UsersController < ApplicationController
  
  def index
  end

  #use to get form for new user to complate
  def new
    @user = User.new
  end

  # new forward the completed for to create to create the user in the db in all form entry passes user model validations
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to our App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    #byebug
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
