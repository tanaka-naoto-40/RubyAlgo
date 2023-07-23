class LessonsController < ApplicationController
  def show
    # @category = Category.find_by(name: params[:name])
    @lessons = @category.lessons
  end
  def index
    @category = Category.find(params[:category_id])
    # binding.pry
    @lessons = @category.lessons
  end

end
