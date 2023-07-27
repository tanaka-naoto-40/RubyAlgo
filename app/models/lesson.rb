class Lesson < ApplicationRecord
  has_many :answers
  belongs_to :course
end
