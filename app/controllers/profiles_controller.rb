class ProfilesController < ApplicationController
  before_action :require_login
  before_action :set_user, only: %i[show edit update alarm set_alarm remove_alarm]

  def show
    @bookmark_lessons = current_user.bookmark_lessons
    @incorrect_lessons = Lesson.joins(:progresses)
    .where(progresses: { user_id: current_user.id, status: Progress.statuses[:incorrect] })
    .where.not(
      id: Progress.where(user_id: current_user.id, status: Progress.statuses[:correct]).select(:lesson_id)
    )
end

  def edit ;end

  def set_alarm
    time_params = alarm_time_params
    time_params["alarm_time(5i)"] = "00"

    if @user.update(time_params)
      redirect_to profile_path, notice: '通知を設定しました'
    else
      flash.now[:danger] = t('defaults.message.alarm_not_registed')
      redirect_to profile_path
    end
  end

  def update
    if @user.update(user_params)
      redirect_to profile_path, notice: 'プロフィールを更新しました'
    else
      render :edit
    end
  end

  def remove_alarm
    @user.update(alarm_time: nil)
    redirect_to profile_path, notice: '通知を解除しました'
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:email, :name, alarms_attributes: [:id, :alarm_time, :lesson_id, :_destroy])
  end

  def alarm_time_params
    params.require(:user).permit(:alarm_time)
  end
end
