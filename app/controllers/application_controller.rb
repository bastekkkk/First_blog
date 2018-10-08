class ApplicationController < ActionController::Base

	helper_method :current_user, :logged_in?

def current_user
	@current_user ||= User.find(session[:user_id]) if session[:user_id]
end

def logged_in?
	#!!curent_user <-- this same
	#this method return true if user logged in
	current_user != nil
end

def require_user
	if !logged_in?
		flash[:danger] = "You must be looged in to perform that action"
		redirect_to root_path
	end
end




end
