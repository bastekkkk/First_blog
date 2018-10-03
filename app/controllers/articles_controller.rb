# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :find_params, only: %i[edit update destroy show]

  def index
    @articles = Article.all
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
    @article.user = User.first
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
    params.require(:article).permit(:title, :description)
  end

  def find_params
    @article = Article.find(params[:id])
  end
end
