class SeasonsController < ApplicationController
  def index
    @seasons = Season.all
  end

  def new
    @season = Season.new
  end

  def create
    @season = Season.new(allowed_params)
    respond_to do |format|
      if @season.save
        format.html { redirect_to seasons_path, notice: 'Season was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def edit
    @season = Season.find params[:id]
  end

  def update
    @season = Season.find params[:id]
    respond_to do |format|
      if @season.update_attributes(allowed_params)
        format.html { redirect_to seasons_path, notice: 'Category was successfully created.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @season = Season.find params[:id]
    @season.destroy
    redirect_to seasons_path
  end

  private
  def allowed_params
    params.require(:season).permit :name, :status
  end
end