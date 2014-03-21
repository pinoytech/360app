class ExamsUsersController < ApplicationController
  def responses
    @exam = Exam.find(params[:exam_id])
    @exams_user = ExamsUser.new(exam_id: @exam.id)
    @exams_user.responses.new
    render 'new'
  end

  def create
    @exams_user = ExamsUser.new(strong_params)
    @exams_user.user_id = current_user.id
    respond_to do |format|
      if @exams_user.save
        format.html { redirect_to messages_path }
      else
        format.html { render action: 'responses' }
      end
    end
  end

  private
  def strong_params
    params.require(:exams_user).permit(:exam_id, :answer, responses_attributes: [:answer])
  end
end