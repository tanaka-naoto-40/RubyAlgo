class Alarm < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  validates :alarm_time, presence: true
end
