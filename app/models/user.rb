class User < ApplicationRecord
  has_many :diaries, dependent: :destroy
  has_many :words, dependent: :destroy

  validates :nickname, presence: true
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
