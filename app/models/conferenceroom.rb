class Conferenceroom < ApplicationRecord
  belongs_to :facility
  has_many :schedules, dependent: :destroy
  
  validates :starttime, presence: true
  validates :endtime, presence: true
  
  validate :start_end_check
  
  def start_end_check
    errors.add(:endtime, "の日付を正しく記入してください。") unless
    self.starttime < self.endtime
  end
  
  
end
