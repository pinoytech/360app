class ExamsController < ApplicationController
  def index
    @exams = Exam.all

    respond_to do |format|
      format.html
    end
  end

  def new
    @exams = Exam.new
        
    respond_to do |format|
      format.html
    end
  end

  def show
    @exam = Exam.find params[:id]
    respond_to do |format|
      format.html
    end
  end
end
