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

    def edit
      @category=Category.find(params[:id])
    end

    def update
      @category=Category.find(params[:id])
      if @category.update(category_params)
        flash[:success]="Updated category!"
        redirect_to admin_categories_path
      else
        flash[:danger]="Title can't be blank."
        render "/admin/categories/edit"
      end
    end

    def destroy
        @category=Category.find(params[:id])
        if @category.destroy
          flash[:success]="Remove category."
          redirect_to admin_categories_path
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
