class ResponsesController < ApplicationController
  def new
    @exams_user = ExamsUser.find(params[:exams_users_id])
    @response = Response.new(exams_user_id: @exams_user.id)
    render 'new'
  end

  def create

    for i in 0..20
      if params[:response]["answer_#{i}".to_sym].present?
        @response = Response.create({ "exams_user_id" => strong_params[:exams_user_id], "answer" => params[:response]["answer_#{i}".to_sym] })
      end
    end

    respond_to do |format|
      if @response
        @response.exams_user.completed = true
        @response.exams_user.save
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
    params.require(:response).permit(:exams_user_id)
  end
end