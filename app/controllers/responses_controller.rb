class ResponsesController < ApplicationController
  def new
    @exams_user = ExamsUser.find(params[:exams_users_id])
    @response = Response.new(exams_user_id: @exams_user.id)
    render 'new'
  end

  def create
    params[:response][:answer].each_with_index do |answer, index|
      @response = Response.create({"exams_user_id" => strong_params[:exams_user_id], "answer" => strong_params[:answer][index]})
    end

    respond_to do |format|
      if @response
        format.html { redirect_to @response }
      else
        format.html {
          @exams_user = ExamsUser.find(params[:response][:exams_user_id])
          render 'new'
        }
      end
    end
  end

  private
  def strong_params
    params.require(:response).permit(:exams_user_id, answer: [])
  end
end