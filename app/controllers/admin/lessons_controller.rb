class Admin::LessonsController < Admin::BaseController
  before_action :set_lesson, only: %i[edit update show destroy]

  def index
    @lessons = Lesson.all
  end

  def show; end

  def new
    @lesson = Lesson.new
  end

  def edit; end

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      redirect_to admin_lessons_path, notice: 'Lessonを作成しました'
    else
      render :new
    end
  end

  def update
    if @lesson.update(lesson_params)
      redirect_to admin_lesson_path(@lesson), notice: 'Lessonを更新しました'
    else
      render :edit
    end
  end

  def destroy
    @lesson.destroy!
    redirect_to admin_lessons_path, notice: 'Lessonを削除しました'
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:course_id, :title, :content, :tips, :published)
  end
end
