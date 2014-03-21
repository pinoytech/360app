class ExamsController < ApplicationController
  def index
    @exams = Exam.all

    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
    @exam = Exam.new
    @categories = Category.all
    @questions = Question.all

    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @exam = Exam.find params[:id]
    respond_to do |format|
      format.html
    end
  end

  def question_list
    @questions = Question.all
    respond_to do |format|
      format.json
    end  
  end

  def create
    questions = Question.where(id: params[:selected_questions].split(','))
    @exam = Exam.new(allowed_params)
    respond_to do |format|
      if @exam.save
        @exam.questions << questions
        format.html { redirect_to exams_path, notice: 'Exam was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end    
  end

  def edit
    @exam = Exam.find params[:id]
    @categories = Category.all
    @questions = Question.all    
    @selected_questions = @exam.questions
    @questions = @questions - @selected_questions    
    respond_to do |format|
      format.html
    end    
  end

  def update
    questions = Question.where(id: params[:selected_questions].split(','))
    @exam = Exam.find params[:id]
    respond_to do |format|
      if @exam.update_attributes(allowed_params)
        @exam.questions.destroy_all
        @exam.questions << questions
        format.html { redirect_to exams_path, notice: 'Exam was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end    
  end

  def destroy
    @exam = Exam.find params[:id]
    @exam.destroy
    redirect_to exams_path
  end

  def category_questions
    if params[:category_id].present?
      @category = Category.find params[:category_id]
      @questions = @category.questions
    else
      @questions = Question.all
    end
    respond_to do |format|
      format.html
      format.json
    end    
  end

  def select_questions
    @question_ids = params[:question_ids].split(',')
    
    if params[:catregory_id]
      @category = Category.find params[:category_id]
      @questions = @category.questions
    else
      @questions = Question.all
    end

    @selected_questions = Question.where(id: @question_ids)
    @questions = @questions - @selected_questions
  end

  def remove_questions
    @question_ids = params[:question_ids].split(',')
    
    if params[:catregory_id]
      @category = Category.find params[:category_id]
      @questions = @category.questions
    else
      @questions = Question.all
    end

    @selected_questions = Question.where(id: @question_ids)
    @questions = @questions - @selected_questions    
  end

  private
  def allowed_params
    params.require(:exam).permit :name, :description, :season_id
  end
end
