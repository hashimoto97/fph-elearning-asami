class LessonsController < ApplicationController
  def create
    @category=Category.find(params[:category_id])
    @lesson=@category.lessons.create(user_id:current_user.id)
    redirect_to new_category_answer_url(@category.id)
  end

  def show
    @category=Category.find(params[:id])
    @words=@category.words
    @choices=Choice.where(word_id: @words.pluck(:id))
    @choice_corrects=@choices.where(correct: 1)
    @lesson=@category.lessons.find_by(user_id:current_user.id)
    @answers=@lesson.answers
    
    @choice_answers=Choice.where(id: @answers.pluck(:choice_id))
    @count=@lesson.choices.where(correct: 1)
  end
end

