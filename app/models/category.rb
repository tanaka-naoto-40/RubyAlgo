class Category < ApplicationRecord
  has_many :courses

  validates :title, presence: true
  validates :content, presence: true
end
