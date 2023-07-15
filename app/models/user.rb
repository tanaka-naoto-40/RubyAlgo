class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :password, presence: true, confirmation: true, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true
  validates :username, presence: true, length: { maximum: 50 }
end
