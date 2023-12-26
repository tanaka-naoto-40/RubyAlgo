class LessonsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @course = Course.find(params[:course_id])
    @lesson = @course.lessons.where(published: true)
    @lessons = @course.lessons.where(published: true)
  end

  # def result
  #   @category = Category.find(params[:category_id])
  #   @selected_answers = params[:answers]
  #   @results = {}
  #   @selected_answers&.each do |lesson_id, answer_id|
  #     @results[lesson_id] = Lesson.generate_result(lesson_id, answer_id)
  #   end
  # end
end
