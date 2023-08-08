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
    @selected_answers = params[:answers]
    @results = {}
    params[:answers].each do |lesson_id, answer_id|
      lesson = Lesson.find(lesson_id) # Find the lesson
      answer = Answer.find(answer_id)
      @results[lesson_id] = { 
        lesson_title: lesson.title,
        lesson_content: lesson.content,
        lesson_answers: lesson.answers,
        answer_id: answer.id,
        answer_content: answer.content,
        correct: answer.answer
      } # Keep the lesson's details and the correctness of the answer
      # binding.pry
    end
  end


end
