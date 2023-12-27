class LessonsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @course = Course.find(params[:course_id])
    @lesson = @course.lessons.where(published: true)
    @lessons = @course.lessons.where(published: true)
  end
end
