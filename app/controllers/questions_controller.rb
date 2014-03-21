class QuestionsController < ApplicationController
  def index
    @questions = Question.all

    respond_to do |format|
      format.html
    end
  end

  def show
    @question = Question.find params[:id]
    respond_to do |format|
      format.html
    end
  end

  def new
    @question = Question.new
    @categories = Category.all

    respond_to do |format|
      format.html
    end
  end

  def create
    @question = Question.new(question_params)
    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  private
    def question_params
      params.require(:question).permit(:title, :description, :category_id)
    end
end
