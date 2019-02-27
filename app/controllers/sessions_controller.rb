class SessionsController < ApplicationController
  def create
    binding.pry
    user = User.find_by(name: params[:name])
   authenticated = user.try(:authenticate, params[:password])
   return head(:forbidden) unless authenticated
   @user = user
   session[:user_id] = @user.id
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
