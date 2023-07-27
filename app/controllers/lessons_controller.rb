class LessonsController < ApplicationController
  def show
    @lesson = Lesson.find(params[:id])
    @category = Category.find(params[:category_id])
    @lessons = @category.lessons.where(published: true)
    @answers = @lesson.answers
  end

  def index
    @category = Category.find(params[:category_id])
    @course = Course.find(params[:course_id])
    @lessons = @course.lessons.where(published: true)
  end

  def result
    
  end

end
