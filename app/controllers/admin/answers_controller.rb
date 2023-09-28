class Admin::AnswersController < Admin::BaseController
  before_action :set_answer, only: %i[edit update show destroy]

  def index
    @lesson = Lesson.find(params[:lesson_id])
    @answers = @lesson.answers
  end

  def show
    @answer = Answer.find(params[:id])
    @lesson = @answer.lesson
  end

  def new
    @lesson = Lesson.find(params[:lesson_id])
    @answer = @lesson.answers.build
  end

  def edit
    @answer = Answer.find(params[:id])
    @lesson = @answer.lesson
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to admin_lesson_answers_path, notice: 'answerを作成しました'
    else
      render :new
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to admin_answer_path(@answer), notice: 'answerを更新しました'
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy!
    redirect_to admin_answer_path, notice: 'answerを削除しました'
  end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:lesson_id, :content, :explanation, :correct_code, :answer)
  end
end
