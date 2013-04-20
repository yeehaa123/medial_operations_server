class SlidesController < ApplicationController
  include ActionController::Live
  skip_before_action :verify_authenticity_token

  def index
     render json: Slide.all
  end

  def create
    attributes = params.require(:slide).permit!
    @slide = Slide.create(attributes)
    if @slide.persisted?
      $redis.publish('messages.create', @slide.to_json)
    end
    render nothing: true
  end

  def events
    response.headers['Content-Type'] = 'text/event-stream'
    uri = URI.parse(ENV["REDISCLOUD_URL"])
    redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
    redis.subscribe('messages.create') do |on|
      on.message do |event, data|
        response.stream.write("data: #{data}\n\n")
      end
    end
  ensure
    redis.quit
    response.stream.close
  end
end
