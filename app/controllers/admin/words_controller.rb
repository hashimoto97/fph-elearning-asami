class Admin::WordsController < ApplicationController
    def index
        @category=Category.find(params[:category_id])
        @words = @category.words.order(created_at: :desc).paginate(page: params[:page],per_page: 10)
    end

    def new
        @word=Word.new
        @word.choices.build
        @category=Category.find(params[:category_id])
    end

    def create
      @category=Category.find(params[:category_id])  
      @word=@category.words.new(word_params)
        if @word.save
          flash[:success]="Successfully added word!"
          redirect_to admin_category_words_path(@category.id)
        else
          flash[:danger]="Word can't be blank."
          render "new"
        end
    end

    def edit
        @word=Word.find(params[:id])
        @category=Category.find(params[:category_id])
    end
  
      def update
        @word=Word.find(params[:id])
        @category=Category.find(params[:category_id])
        if @word.update(word_params)
          flash[:success]="Updated word!"
          redirect_to admin_category_words_path(@category.id)
        else
          flash[:danger]="Word can't be blank."
          render "edit"
        end
      end
  
      def destroy
          @word=Word.find(params[:id])
          @category=Category.find(params[:category_id])
          if @word.destroy
            flash[:success]="Remove word."
            redirect_to admin_category_words_path(@category.id)
          end
      end

    private        
        def word_params
            params.require(:word).permit(:content,choices_attributes: [:content,:correct])
        end
end
