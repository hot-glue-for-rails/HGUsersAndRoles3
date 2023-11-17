class Admin::BaseController < ApplicationController

  before_action :authenticate_admin!

  def authenticate_admin!
    redirect_to new_user_session_path unless current_user && (current_user.admin? || current_user.superadmin?)
  end
end

