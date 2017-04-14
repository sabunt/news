class HotNew < ApplicationRecord

  validates :deadline, :title, :description presence: true
  validate :time_validate, on: :create

  def time_validate
    if deadline < Time.now()
      errors.add(:deadline, 'Invalid Time, please correct Time')


  end

end
