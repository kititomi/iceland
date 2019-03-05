class ApplicationController < ActionController::Base

before_action :set_current_user

  def after_sign_in_path_for(resource)

       tweets_new_path  #　指定したいパスに変更
   end
end



 def set_current_user
   @current_user = User.find_by(id: session[:user_id])
 end
