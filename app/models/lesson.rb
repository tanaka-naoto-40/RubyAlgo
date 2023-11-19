class Lesson < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  belongs_to :course

  validates :title, presence: true
  validates :content, presence: true
end
