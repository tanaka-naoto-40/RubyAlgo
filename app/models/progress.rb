class Progress < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  enum status: { incorrect: 0, correct: 1 }
end
