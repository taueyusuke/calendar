class Schedule < ApplicationRecord
  belongs_to :conferenceroom
  belongs_to :user
  
  validates :starttime, presence: true
  validates :endtime, presence: true
  
  
  validate :start_end_check
  
  def start_end_check
    errors.add(:endtime, "の日付を正しく記入してください。") unless
    self.starttime < self.endtime
  end
  
  
  
end
