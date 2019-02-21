class LessonsController < ApplicationController
  def create
    @category=Category.find(params[:category_id])
    @lesson=@category.lessons.create(user_id:current_user.id)
    redirect_to new_category_answer_url(@category.id)
  end
end

