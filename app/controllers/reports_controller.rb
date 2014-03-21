class ReportsController < ApplicationController
  def index
    @active_exams_id = Season.active_exams.map(&:id)
    incomplete = ExamsUser.where(exam_id: @active_exams_id).incomplete.count
    completed = ExamsUser.where(exam_id: @active_exams_id).complete.count
    total = completed + incomplete
    @completed = completed.to_f/total.to_f*100
    @incomplete = incomplete.to_f/total.to_f*100
  end
end