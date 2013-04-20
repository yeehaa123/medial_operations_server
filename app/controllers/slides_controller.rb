class SlidesController < ApplicationController
  include ActionController::Live

  respond_to :json 

  def index
    respond_with Slide.all
  end

  def create
    params.require(:slide).permit!
    respond_with Slide.create(params[:slide])
  end

  def events
    response.headers['Content-Type'] = 'text/event-stream'
    10.times do |n|
      response.stream.write "#{n}...\n\n"
      sleep 2
    end
  ensure
    response.stream.close
  end
end
