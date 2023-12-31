class Admin::BaseController < ApplicationController
  before_action :require_login
  before_action :check_admin
  layout 'admin/layouts/application'

  private

  def not_authenticated
    redirect_to root_path
  end

  def check_admin
    redirect_to root_path unless current_user.admin?
  end
end
