class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all

  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: 'userを更新しました'
    else
      render :edit
    end
  end


  def destroy
    @user.destroy!
    redirect_to admin_users_path, notice: 'userを削除しました'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :username, :role)
  end
end
