class BadgesController < ApplicationController
  def index
    @badges = Badge.all

    respond_to do |format|
      format.html
    end
  end

  def show
    @badge = Badge.find params[:id]
    respond_to do |format|
      format.html
    end
  end

  def new
    @badge = Badge.new

    respond_to do |format|
      format.html
    end
  end

  def create
    @badge = Badge.new(badge_params)
    respond_to do |format|
      if @badge.save
        format.html { redirect_to @badge, notice: 'Badge was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  private
    def badge_params
      params.require(:badge).permit(:name, :description, :image)
    end
end