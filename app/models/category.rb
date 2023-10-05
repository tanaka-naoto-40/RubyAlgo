class Category < ApplicationRecord
  has_many :courses, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true
end
