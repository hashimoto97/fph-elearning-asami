class AnswersController < ApplicationController
  def new
    @category=Category.find(params[:category_id])
    @words=@category.words
    lesson=@category.lessons.find_by(user_id:current_user.id)
    
    x = 0
    @words.each do |word|
      x = x + 1
      @y = x
      unless lesson.answers.pluck(:word_id).include?(word.id)
        @word=word
        break
      end
    end
    
    if @word.nil? 
        redirect_to lesson_path(params[:category_id])
    else
        @choices=@word.choices
    end
  end


  def create
    category=Category.find(params[:category_id])
    lesson=category.lessons.find_by(user_id:current_user.id)
    answer=lesson.answers.create(word_id: params[:word_id],choice_id:params[:choice_id])

    redirect_to new_category_answer_url(category.id)
  end
end
