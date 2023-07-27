class CoursesController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @courses = @category.courses
  end
end
