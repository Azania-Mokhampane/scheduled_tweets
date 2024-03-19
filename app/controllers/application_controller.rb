class ApplicationController < ActionController::Base
# this method is available to all controllers, it will call 
# set_current_user before any action is called
   before_action :set_current_user

   def set_current_user
       if session[:user_id]
          Current.user = User.find_by(id: session[:user_id])
      end
   end
end
