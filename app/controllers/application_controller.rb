class ApplicationController < ActionController::Base
  private

  def confirm_logged_in
    if session[:user_id]
      true
    else
      flash[:notice] = "Please log in to view this page."
      redirect_to(controller: "access", action: "login")
      false
    end
  end
end
