class LessonsController < ApplicationController
  def create
    @category=Category.find(params[:category_id])
    @lesson=@category.lessons.create(user_id:current_user.id)
    redirect_to answers_new_url
  end
end

