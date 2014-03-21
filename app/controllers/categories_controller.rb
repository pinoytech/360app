class CategoriesController < ApplicationController
  def index
    @categories = Category.all.order("created_at DESC")

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

  def edit
    @category = Category.find params[:id]
  end

  def update
    @category = Category.find params[:id]
    respond_to do |format|
      if @category.update_attributes(allowed_params)
        format.html { redirect_to categories_path, notice: 'Category was successfully created.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy    
    @category = Category.find params[:id]
    @category.destroy
    redirect_to categories_path
  end

  private
    def allowed_params
      params.require(:category).permit :name, :description
    end    
end