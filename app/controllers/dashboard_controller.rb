class DashboardController < ApplicationController
  before_action :require_login

  def index
    @user=User.find_by(id:current_user.id)
  end

  def words
    # @words_learned=Word.paginate(page: params[:page],per_page: 5)
    @user=User.find_by(id:current_user.id)
    @lessons=@user.lessons
    @answers=@user.answers.paginate(page: params[:page],per_page: 5)
  end
end
