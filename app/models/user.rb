class User < ApplicationRecord
  has_secure_password
  before_save :downcase_email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  validates :password, presence: true, length: { minimum: 5, maximum: 50 }
  has_many :strains

  private

  def downcase_email
    self.email = email.downcase
  end
end
