class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  validates :user_id, uniqueness: { scope: :lesson_id }
end
