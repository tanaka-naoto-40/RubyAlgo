class BookmarksController < ApplicationController
  before_action :require_login

  def create
    lesson = Lesson.find(params[:lesson_id])
    current_user.bookmark(lesson)
    redirect_to request.referer
  end

  def destroy
    lesson = Lesson.find(params[:id])
    current_user.unbookmark(lesson)
    redirect_to request.referer
  end
end
