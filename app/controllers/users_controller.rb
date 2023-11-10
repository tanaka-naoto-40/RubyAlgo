class UsersController < ApplicationController
  require 'net/http'
  require 'uri'

  def new
    redirect_to profile_path if current_user
  end

  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     redirect_to root_path, notice: 'ユーザー登録が完了しました'
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  def create
    id_token = params[:idToken]
    channel_id = "2001555691"
    res = Net::HTTP.post_form(URI.parse('https://api.line.me/oauth2/v2.1/verify'), { 'id_token' => id_token, 'client_id' => channel_id })
    line_user_id = JSON.parse(res.body)['sub']
    user = User.find_by(line_user_id:)
    if user.nil?
      user = User.create(line_user_id:)
    elsif (session[:user_id] = user.id)
      render json: user
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'ログアウトしました'
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
