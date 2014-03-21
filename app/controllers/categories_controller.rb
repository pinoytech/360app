class CategoriesController < ApplicationController
  def index
    @categories = Category.all

    respond_to do |format|
      format.html
    end
  end

  def show
    @category = Category.find params[:id]
    respond_to do |format|
      format.html
    end
  end

  def new
    @category = Category.new

    respond_to do |format|
      format.html
    end
  end

  def create
    @category = Category.new(allowed_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, notice: 'Category was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  private
    def allowed_params
      params.require(:category).permit :name, :description
    end    
end