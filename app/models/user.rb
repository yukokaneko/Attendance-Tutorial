class User < ApplicationRecord
  before_save { self.email = email.downcase } # 小文字に変換

  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 100 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true # 一意性　同じのがないか    
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end