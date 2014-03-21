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

  def admins
    @users = User.admin
    @accounts = Account.all
    respond_to do |format|
      format.html
    end
  end

  def assign_exam
    @user = User.find params[:id]
    @exams = Season.active_exams
    @exams = @exams - @user.exams
    @exams_user = ExamsUser.new
  end

  def save_exam
    @exams_user = ExamsUser.new(exams_user_params)
    respond_to do |format|
      if @exams_user.save
        @account = current_user.account        
        @users = @account.users
        format.html { redirect_to users_path, notice: 'Exam was successfully assigned.' }
        format.js
      else
        format.html { render action: 'assign_exam' }
        format.js
      end
    end
  end

  private
  
  def exams_user_params
    params.require(:exams_user).permit(:user_id, :exam_id, :ratee_id)
  end
end
