class Lesson < ApplicationRecord
  has_many :answers
  belongs_to :course

  validates :title, presence: true
  validates :content, presence: true
end
