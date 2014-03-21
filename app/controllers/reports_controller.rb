class ReportsController < ApplicationController
  def index
    @incomplete = Exam.incomplete
    binding.pry
    @completed = Exam.completed
  end
end