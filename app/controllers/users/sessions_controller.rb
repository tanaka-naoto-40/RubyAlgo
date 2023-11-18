class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  def new
    super
  end

  def create
    super
    flash[:notice] = 'ログインしました'
  end

  def destroy
    super
    flash[:notice] = 'ログアウトしました'
  end

  def after_sign_in_path_for(resource)
    profile_path
  end 

  def after_sign_out_path_for(resource)
    root_path
  end 

  protected

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
end
