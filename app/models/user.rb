class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_lessons, through: :bookmarks, source: :lesson
  validates :password, presence: true, confirmation: true, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true
  validates :username, presence: true

  enum role: { general: 0, admin: 1 }

  def bookmark(lesson)
    bookmark_lessons << lesson
  end

  def unbookmark(lesson)
    bookmark_lessons.destroy(lesson)
  end

  def bookmark?(lesson)
    bookmark_lessons.include?(lesson)
  end
end
