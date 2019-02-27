class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:name])
   authenticated = user.try(:authenticate, params[:password])
   return head(:forbidden) unless authenticated
   @user = user
   session[:user_id] = @user.id
  end
end
