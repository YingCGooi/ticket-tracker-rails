class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{@user.name}!"
      redirect_to root_path
    else
      render :new
    end
  end
 
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def require_same_user
    if current_user != @user
      flash[:error] = "You're not allowed to do that."
    end
  end
end