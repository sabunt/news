class HotNewsController < ApplicationController
require "rss"

  def index 

    @hotnew = HotNew.lastpost


    

  end

  def  admin
    @hotnew = HotNew.last || HotNew.new()
  end

  def create
    @hotnew = HotNew.new(setting_params)
    if @hotnew.save
      ActionCable.server.broadcast 'update_news_channel', @hotnew
      ReturnNewJob.set(wait_until: @hotnew.deadline).perform_later(@hotnew)
      flash[:success] = 'Post created'
      redirect_to root_path
    else
      flash[:error] = @hotnew.errors.messages.values.flatten.join('<br>').html_safe
      render :admin
    end
  end



  private

    def setting_params
      params.require(:hot_new).permit(:deadline, :title, :description)
    end
end
