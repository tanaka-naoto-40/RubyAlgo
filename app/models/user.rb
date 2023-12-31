class User < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_lessons, through: :bookmarks, source: :lesson
  has_many :progresses
  has_many :progress_lessons, through: :progresses, source: :lesson

  enum role: { general: 0, admin: 1 }

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,
  :omniauthable, omniauth_providers: %i[line]

  def bookmark(lesson)
    bookmark_lessons << lesson
  end

  def unbookmark(lesson)
    bookmark_lessons.destroy(lesson)
  end

  def bookmark?(lesson)
    bookmark_lessons.include?(lesson)
  end

  def social_profile(provider)
    social_profiles.select { |sp| sp.provider == provider.to_s }.first
  end

  def set_values(omniauth)
    return if provider.to_s != omniauth["provider"].to_s || uid != omniauth["uid"]
    credentials = omniauth["credentials"]
    info = omniauth["info"]

    access_token = credentials["refresh_token"]
    access_secret = credentials["secret"]
    credentials = credentials.to_json
    name = info["name"]
  end

  def set_values_by_raw_info(raw_info)
    self.raw_info = raw_info.to_json
    self.save!
  end

  # ランキングの計算
  def self.ranking
    joins(:progresses)
      .where(progresses: { status: Progress.statuses[:correct] })
      .group(:id)
      .order(Arel.sql('COUNT(progresses.id) DESC'))
      .select('users.*, COUNT(progresses.id) AS correct_progress_count')
  end
end
