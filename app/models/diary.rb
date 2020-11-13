class Diary < ApplicationRecord
  belongs_to :user
  has_many :words, dependent: :destroy
  accepts_nested_attributes_for :words
  has_one_attached :image

  def self.search(search)
    if search != ""
      Diary.where('content LIKE(?)', "%#{search}%")
    else
      Diary.all
    end
  end
end
