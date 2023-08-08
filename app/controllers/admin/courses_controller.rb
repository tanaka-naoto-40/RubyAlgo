class Admin::CoursesController < Admin::BaseController
  before_action :set_course, only: %i[edit update show destroy]

  def index
    @courses = Course.all
  end

  def edit; end

  def update
    if @course.update(course_params)
      redirect_to admin_course_path(@course)
    else
      render :edit
    end
  end

  def show; end

  def destroy
    @course.destroy!
    redirect_to admin_courses_path
  end

  private

  def set_course
    @course = course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :content)
  end
end
