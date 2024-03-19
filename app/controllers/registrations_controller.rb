class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # check if it saves user successfully
    if @user.save
      # if we use the cookies method anyone can see the user id in the browser,
      #  but if we use the session method, the user id is hashed in the session
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Successfully created account"
    else 
      # flash[:alert] = "Account creation failed"
      render :new, status: :unprocessable_entity
    end
  end

  private 

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
 