class AnswersController < ApplicationController
  def new
    @category=Category.find(params[:category_id])
    @words=@category.words
    lesson=@category.lessons.find_by(user_id:current_user.id)
    
    @words.each do |word|
      unless lesson.answers.pluck.include?(word.id)
        @word=word
        break
      end
    end

    @choices=@word.choices
  end

  def create
    category=Category.find(params[:category_id])
    lesson=category.lessons.find_by(user_id:current_user.id)
    answer=lesson.answers.create(word_id: params[:word_id],choice_id:params[:choice_id])

    redirect_to new_category_answer_url(category.id)
  end
end
