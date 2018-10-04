class SessionsController < ApplicationController
  def new
  end

  def create
	 	user = User.find_by(email: params[:session][:email].downcase)
	 	if user && user.authenticate(params[:session][:password_digest])
	 		session[:user_id] = user.id
	 		flash[:success]= "you have successfuly login"
	 		redirect_to users_path(user)
	 		else
	 				flash.now[:danger] = "there was smothing wrong "
	 				render 'new'
					 	end
  end

  def destory
  end
end
