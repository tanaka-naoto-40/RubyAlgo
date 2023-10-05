class Admin::CoursesController < Admin::BaseController
  before_action :set_course, only: %i[edit update show destroy]

  def index
    @courses = Course.all
  end

  def show; end

  def new
    @course = Course.new
  end

  def edit; end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to admin_courses_path, notice: 'Courseを作成しました'
    else
      render :new
    end
  end

  def update
    if @course.update(course_params)
      redirect_to admin_course_path(@course), notice: 'Courseを更新しました'
    else
      render :edit
    end
  end

  def destroy
    @course.destroy!
    redirect_to admin_courses_path, notice: 'Courseを削除しました'
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :content, :category_id)
  end
end
