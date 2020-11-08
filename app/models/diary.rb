class Diary < ApplicationRecord
  belongs_to :user
  has_many :words, dependent: :destroy
  has_one_attached :image
end
