class ProfilesController < ApplicationController
  before_action :require_login
  before_action :set_user, only: %i[edit update]

  def show
    @bookmark_lessons = current_user.bookmark_lessons
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to profile_path
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:email, :username)
  end
end
