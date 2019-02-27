class DashboardController < ApplicationController
  before_action :require_login
  def index
    @user=User.find_by(id:current_user.id)
  end

  private
    def require_login
      unless logged_in?
        flash[:danger]="Please log in."
        redirect_to login_url
      end
    end
end
