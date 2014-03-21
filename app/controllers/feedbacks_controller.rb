class FeedbacksController < ApplicationController
  def index
    @pending_feedback = current_user.exams_users.incomplete
  end
end