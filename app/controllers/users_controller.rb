# frozen_string_literal: true

class UsersController < ApplicationController

before_action :set_user,  only: [:show, :edit, :update]
before_action :require_same_user , only: [:edit, :update, :destroy]
before_action :require_admin , only: [:destroy]

  def new
    @user = User.new
  end

  def show
    #@user = User.find(params[:id])
    @user_article = @user.articles.paginate(page: params[:page], per_page: 2)
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 2)
  end

  
  def destroy
    @user = User.find(params[:id])
    @user.destroy 
    flash[:danger] = "successfuly has been daleted accout with us articles"
    redirect_to users_path
  end




  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = 'Successfuly created user'
      redirect_to user_path(@user)
    else
      render 'new'
  end
end

    def edit
      #@user = User.find(params[:id])
    end

    def update
      #@user = User.find(params[:id])
      if @user.update(user_params)
        flash[:success] = "Successfuly updated"
        redirect_to articles_path
      else
        render 'edit'
    end
  end
  


    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:success] = "Successfuly updated"
        redirect_to articles_path
      else
        render 'edit'
    end
  end
  


  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  

  def require_same_user
    if current_user != @user and !current_user.admin?
      flash[:danger]= "You can only edit own accout"
      redirect_to root_path
    end
  end

 def require_admin
  if logged_in? and !current_user.admin?
    flash[:danger] = "only admin can perform that action"
    redirect_to root_path
  end
end

 end



