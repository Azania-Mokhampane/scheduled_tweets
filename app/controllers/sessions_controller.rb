class SessionsController < ApplicationController
    def new 
      
    end

    def create
      user = User.find_by(email: params[:email])
        if user.present? && user.authenticate(params[:password])
            # kepping the user logged in
            session[:user_id] = user.id
            redirect_to root_path, notice: "Logged in successfully!"
        else
            flash[:alert] = "Invalid email or password"
            # the render new simply renders the new.html.erb file
            render :new, status: :unauthorized
        end
    end

    def destroy
      session[:user_id] = nil
        redirect_to root_path, notice: "Logged out!"
    end
end