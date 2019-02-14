class Admin::CategoriesController < ApplicationController
    before_action :admin_user
    def index
        @categories = Category.order(created_at: :desc).paginate(page: params[:page],per_page: 10)
    end

    def new
        @category=Category.new
    end

    def create
        @category=Category.new(category_params)
    
        if @category.save
          flash[:success]="Successfully added category!"
          redirect_to admin_categories_path
        else
          flash[:danger]="Title can't be blank."
          render "/admin/categories/new"
        end
      end
        
    private 
        def admin_user
            redirect_to(root_url) unless current_user.admin?
        end

        def category_params
          params.require(:category).permit(:title,:description)
        end
end
