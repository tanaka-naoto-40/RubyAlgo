class Course < ApplicationRecord
  has_many :lessons, dependent: :destroy
  belongs_to :category

  validates :title, presence: true
  validates :content, presence: true
end
