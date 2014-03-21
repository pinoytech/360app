class ExamsController < ApplicationController
  def index
    @exams = Exam.all

    respond_to do |format|
      format.html
    end
  end

  def new
    @exam = Exam.new
    @categories = Category.all
    @questions = Question.all

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

  def category_questions
    if params[:category_id].present?
      @category = Category.find params[:category_id]
      @questions = @category.questions
    else
      @questions = Question.all
    end
    
  end
end
