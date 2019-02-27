class DashboardController < ApplicationController
  before_action :require_login
  def index
    @user=User.find_by(id:current_user.id)
  end
end
