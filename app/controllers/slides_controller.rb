class SlidesController < ApplicationController
  respond_to :json 

  def index
    respond_with Slide.all
  end

  def create
    params.require(:slide).permit!
    respond_with Slide.create(params[:slide])
  end
end
