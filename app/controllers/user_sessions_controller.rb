class UserSessionsController < ApplicationController
  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      flash[:success] = 'success'
      redirect_back_or_to root_path
    else
      flash.now[:danger] = 'fail'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
