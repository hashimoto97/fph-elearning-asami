class CategoriesController < ApplicationController
  before_action :require_login
  def index
    @categories=Category.order(created_at: :desc).paginate(page: params[:page],per_page: 10)
  end
end
