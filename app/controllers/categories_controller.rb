class CategoriesController < ApplicationController
  def index; 
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @courses = @category.courses
  end
end
