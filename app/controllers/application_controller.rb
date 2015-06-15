class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :admin?

  def admin?; current_user end

  private

    def current_user_id id = nil
      if id.nil?
        session[:current_user_id]  
      else
        session[:current_user_id] = id.to_i
      end
    end

    def current_user
      @current_user ||= current_user_id ? User.find(current_user_id) : nil
    end

end
