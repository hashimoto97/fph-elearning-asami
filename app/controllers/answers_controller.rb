class AnswersController < ApplicationController
  def new
    @category=Category.find(params[:category_id])
    @words=@category.words
    lesson=@category.lessons.find_by(user_id:current_user.id)
    
    @words.each_with_index do |word,x|
      @proceed = x + 1
      unless lesson.answers.pluck(:word_id).include?(word.id)
        @word=word
        break
      end
    end
    
    if @word.nil? 
        redirect_to lesson_path(lesson.id)
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
