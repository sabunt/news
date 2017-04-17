class ReturnNewJob < ApplicationJob
  queue_as :default
  
  def perform(hotnew)
    HotNew.broadcast_lastpost
  end

end
  