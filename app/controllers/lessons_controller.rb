class LessonsController < ApplicationController

  def index
    @category = Category.find(params[:category_id])
    @course = Course.find(params[:course_id])
    @lesson = @course.lessons.where(published: true)
    @lessons = @course.lessons.where(published: true)
  end

  def show
    @category = Category.find(params[:category_id])
    @courses = @category.courses
    @lesson = Lesson.find_by(course_id: @courses.first.id)
    binding.pry
  end

  def result
    @selected_answers = params[:answers]
    @results = {}
    params[:answers]&.each do |lesson_id, answer_id|
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
