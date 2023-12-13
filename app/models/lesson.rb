class Lesson < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :progresses
  belongs_to :course

  validates :title, presence: true
  validates :content, presence: true

    # 特定のユーザーに関連する不正解のレッスンを取得
    def self.incorrect_lessons_for_user(user_id)
      joins(:progresses)
        .where(progresses: { user_id: user_id, status: Progress.statuses[:incorrect] })
        .where.not(
          id: Progress.where(user_id: user_id, status: Progress.statuses[:correct]).select(:lesson_id)
        )
    end
end
