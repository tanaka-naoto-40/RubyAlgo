class User < ApplicationRecord
  # authenticates_with_sorcery!

  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_lessons, through: :bookmarks, source: :lesson
  has_many :alarms, dependent: :destroy
  accepts_nested_attributes_for :alarms, allow_destroy: true

  # validates :password, presence: true, confirmation: true, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  # validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  # validates :email, uniqueness: true, presence: true
  # validates :username, presence: true
  # validates :line_user_id, presence: true, uniqueness: true

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
end
