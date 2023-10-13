class LessonsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @course = Course.find(params[:course_id])
    @lesson = @course.lessons.where(published: true)
    @lessons = @course.lessons.where(published: true)
  end

  def result
    @category = Category.find(params[:category_id])
    @selected_answers = params[:answers]
    @results = {}
    @selected_answers&.each do |lesson_id, answer_id|
      lesson = Lesson.find(lesson_id)
  
      if answer_id == "default"
        # 未選択の場合の処理
        @results[lesson_id] = {
          lesson_title:    lesson.title,
          lesson_content:  lesson.content,
          lesson_answers:  lesson.answers,
          correct:         false
        }
      else
        # 選択された選択肢がある場合の処理
        answer = Answer.find(answer_id)
        @results[lesson_id] = {
          lesson_title:    lesson.title,
          lesson_content:  lesson.content,
          lesson_answers:  lesson.answers,
          answer_id:       answer.id,
          answer_content:  answer.content,
          correct:         answer.answer
        }
      end
    end
  end
  
end
