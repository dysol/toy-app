class User < ApplicationRecord
  # relationship
  has_many :microposts, dependent: :destroy

  before_save { self.email.downcase! }
  # validation
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :name,
            presence: true,
            length: { maximum: 50, message: 'too long lah'}

  validates :email,
            presence: true,
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  # hashing password
  has_secure_password
  validates :password,
            presence: true,
            length: { minimum: 4 },
            allow_nil: true
end
