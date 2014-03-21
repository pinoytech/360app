class UsersController < ApplicationController
  def index
    @users = User.all
    respond_to do |format|
      format.html
    end
  end

<<<<<<< HEAD
  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
    end
=======
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
>>>>>>> 4f454c96699a145cc5a434c7f5a7ba8ea9e901ac
  end
end
