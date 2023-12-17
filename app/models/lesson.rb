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

  def self.generate_result(lesson_id, answer_id)
    lesson = find(lesson_id)
    # 未選択の場合の処
    if answer_id == "default"
      {
        lesson_title:    lesson.title,
        lesson_content:  lesson.content,
        lesson_answers:  lesson.answers,
        correct:         false
      }
    else
      # 選択された選択肢がある場合の処理
      answer = Answer.find(answer_id)
      {
        lesson_title:    lesson.title,
        lesson_content:  lesson.content,
        lesson_answers:  lesson.answers,
        answer_id:       answer.id,
        answer_content:  answer.content,
        correct:         answer.answer
      }
    end
  end
end
