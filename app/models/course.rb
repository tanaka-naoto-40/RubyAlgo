class Course < ApplicationRecord
  has_many :lessons
  belongs_to :category
end
