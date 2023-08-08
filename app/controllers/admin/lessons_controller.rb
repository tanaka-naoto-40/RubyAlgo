class Admin::LessonsController < Admin::BaseController
  before_action :set_lesson, only: %i[edit update show destroy]

  def index
    @lessons = Lesson.all
  end

  def edit; end

  def update
    if @lesson.update(lesson_params)
      redirect_to admin_lesson_path(@lesson)
    else
      render :edit
    end
  end

  def show; end

  def destroy
    @lesson.destroy!
    redirect_to admin_lessons_path
  end

  private

  def set_lesson
    @lesson = lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:title, :content, :tips, :published)
  end
end
