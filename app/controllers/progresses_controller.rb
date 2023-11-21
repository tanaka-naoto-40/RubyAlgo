class ProgressesController < ApplicationController
  before_action :require_login

  def create
    progress = current_user.progresses.new(progress_params)
    if progress.save
      render json: { status: 'success' }, status: :created
    else
      render json: { errors: progress.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def progress_params
    params.require(:progress).permit(:date, :status, :lesson_id)
  end
end
