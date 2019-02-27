class UsersController < ApplicationController
  def create
   session[:user_id] = User.create(user_params)
  end

 private

 def user_params
   params.require(:user).permit(:name, :password, :password_confirmation)
 end
end
