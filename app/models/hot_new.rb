class HotNew < ApplicationRecord
  require "rss"

 
  validates :deadline, :title, :description, presence: true
  validate :time_validate, on: :create

  def time_validate
    if deadline < Time.now()
      errors.add(:deadline, 'Invalid Time, please correct Time')
    end
  end
  def self.get_new 
   RSS::Parser.parse(open('https://news.yandex.ru/index.rss').read, false).items[0]
  end

  def self.lastpost
    if self.last.deadline < Time.now()
      self.get_new
    else
      self.last
    end
  end

  def self.broadcast_lastpost
    ActionCable.server.broadcast 'update_news_channel', HotNew.lastpost
  end

end
