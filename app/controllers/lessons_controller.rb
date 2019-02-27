class LessonsController < ApplicationController
  def create
    @category=Category.find(params[:category_id])
    @lesson=@category.lessons.create(user_id:current_user.id)
    redirect_to new_category_answer_url(@category.id)
  end

  def show
    # @category=Category.find(params[:id])
    # @lesson=@category.lessons.find_by(user_id:current_user.id)
    @lesson=Lesson.find(params[:id])
    @category=@lesson.category
    @words=@category.words
    # @choices=Choice.where(word_id: @words.pluck(:id))
    # @choice_corrects=@choices.where(correct: 1)
    @choice_corrects=@category.choices
    # @answers=@lesson.answers
    # @choice_answers=Choice.where(id: @answers.pluck(:choice_id))
    @choice_answers=@lesson.choices

    @count=@lesson.choices.where(correct: 1)
  end
end

