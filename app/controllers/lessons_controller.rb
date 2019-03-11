class LessonsController < ApplicationController
  def create
    @category=Category.find(params[:category_id])
    @lesson=@category.lessons.create(user_id:current_user.id)
    # @lesson.create_activity(user_id: current_user.id)
    redirect_to new_category_answer_url(@category.id)
  end

  def show
    @lesson=Lesson.find(params[:id])
    @category=@lesson.category
    @words=@category.words
    @choice_corrects=@category.choices
    @choice_answers=@lesson.choices
    @count=@lesson.result
  end
end

