# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :find_params, only: [:edit, :show , :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user , only: [:edit , :update, :destroy]


  def index
    @articles = Article.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end

  def show; end

  def edit; end

  def new
    @article = Article.new
  end

  def update
    if @article.update(article_params)
      flash[:success] = 'successful updated articles'
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:success] = 'successfuly created article'
      redirect_to article_path(@article)
    else
      flash[:danger] = "you could't crate a new article "

      # puts @article.errors.inspect
      render 'new'
    end
  end

  def destroy
    @article.destroy
    flash[:success] = 'sucessful deleted'
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, category_ids:[])
  end

  def find_params
    @article = Article.find(params[:id])
  end

  def require_same_user
    if current_user != @article.user and !current_user.admin?
      flash[:danger] = "You can change only your article"
      redirect_to root_path
    end

  end


end
