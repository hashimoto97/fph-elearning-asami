class AnswersController < ApplicationController
  def new
    @category=Category.find(params[:category_id])
    @word=@category.words.first
    @words=@category.words
    @choices=@word.choices
  end

  def create
    @category=Category.find(params[:category_id])
    abort
    @word=@category.words
    @choice=@word.choices
    @lesson=@category.lessons
    @answer=@category.answers.create(word_id: @word.id,choice_id: @choice.id,lesson_id: @lesson.id)
    redirect_to new_category_answer_url(@category.id)
  end
end
