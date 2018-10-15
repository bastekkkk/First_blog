class CategoriesController < ApplicationController

  def index
  	@categories = Category.all
  end

  def home
  end

  def new
  	@category = Category.new
  end

  def create
  	@category = Category.new(category_params)
  	if @category.save
  		flash[:success] = "successfuly created category"
  		redirect_to categories_path
  	else
  		render 'new'
  	end

  end

private

def category_params
	params.require(:category).permit(:name)
end


end