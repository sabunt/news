class UpdateNewsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "update_news_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

end
