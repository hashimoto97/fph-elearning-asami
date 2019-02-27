class UsersController < ApplicationController
  before_action :require_login,only: [:index,:show]

  def index
    @users=User.paginate(page: params[:page],per_page: 10)
  end

  def new
    @user=User.new
  end

  def create
    @user=User.new(user_params)

    if @user.save
      flash[:success]="Successfully account!"
      redirect_to root_url
    else
      render "new"
    end
  end

  def show
      @user=User.find(params[:id])
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
      flash[:success]="Updated account!"
      redirect_to @user
    else
      render "edit"
    end
  end

  def following
    @user=User.find(params[:id])
    @title="Following"
    @users=@user.following.paginate(page: params[:page],per_page: 10)
    render "users/follow"
  end

  def followers
    @user=User.find(params[:id])
    @title="Followers"
    @users=@user.followers.paginate(page: params[:page],per_page: 10)
    render "users/follow"
  end

  private
    def user_params
      params.require(:user).permit(:name,:email,:password,:password_confirmation,:image)
    end
end
