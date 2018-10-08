# frozen_string_literal: true

class UsersController < ApplicationController

before_action :set_user,  only: [:show, :create, :edit, :update]
before_action :require_user

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



  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Successfuly created user'
      redirect_to articles_path
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
  


  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
