class User < ApplicationRecord

  before_save { self.email = email.downcase } # is equal to self.email = self.email.downcase, self is optional on the right-hand side

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates(:name, presence: true, length: { maximum: 50 })
  validates(:email, presence: true, length: { maximum: 255 }, format: {with: VALID_EMAIL_REGEX}, uniqueness: true)
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
