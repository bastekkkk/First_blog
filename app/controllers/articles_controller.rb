# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :find_params, only: [:edit, :update, :destroy, :show]

  def index
    @articles = Article.all
  end

  def show; end

  def edit
  end
  

  def new
    @article = Article.new
  end

  def update
    if @article.update(article_params)
      flash[:notice] = 'successful updated articles'
      redirect_to article_patch(@article)
    else
      render 'edit'
    end
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = 'successfuly created article'
      redirect_to article_patch(@article)
    else
      render 'new'
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = 'sucessful deleted'
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
