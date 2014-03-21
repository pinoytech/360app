class UsersController < ApplicationController

  def index
    @account = current_user.account
    @users = @account.users
    respond_to do |format|
      format.html
    end
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def assign_exam
    @user = User.find params[:id]
    @exams = Season.active_exams
  end

  def save_exam
    @user = User.find params[:id]
    redirect_to users_path
  end

  private
    def strong_params
      params.require(:user).permit(
        {
            exams_attributes: [
                :exam_id
            ],
            ratees_attributes: [
                :ratee_id
            ]
        })
    end
end
