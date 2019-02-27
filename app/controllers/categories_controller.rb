class CategoriesController < ApplicationController
  before_action :require_login
  def index
    @categories=Category.order(created_at: :desc).paginate(page: params[:page],per_page: 10)
  end

  private
    def require_login
      unless logged_in?
        flash[:danger]="Please log in."
        redirect_to login_url
      end
    end
end
