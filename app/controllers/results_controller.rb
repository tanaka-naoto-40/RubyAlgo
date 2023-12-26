class ResultsController < ApplicationController
  def create
    @category = Category.find(params[:category_id])
    @selected_answers = params[:answers]
    @results = {}
    @selected_answers&.each do |lesson_id, answer_id|
      @results[lesson_id] = Lesson.generate_result(lesson_id, answer_id)
    end
    render :show
  end

  def show; end
end
