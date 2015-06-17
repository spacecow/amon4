class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username:params[:login])
    if user && user.authenticate(params[:password])
      current_user_id user.id
      redirect_to pages_path, notice:"Successfully logged in"
    else
      flash.now.alert = "Invalid login credentials"
      render "new"
    end
  end

end
