class FeedbacksController < ApplicationController
  def index
    @pending_feedback = current_user.exams_users.incomplete
    @provided_feedbacks = current_user.exams_users.complete
  end

  def show
    @feedback = ExamsUser.find(params[:id])
  end

end