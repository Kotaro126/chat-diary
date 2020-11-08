class UserPost
  include ActiveModel::Model
  attr_accessor :image, :title, :content, :word_name, :example, :user_id, :diary_id

  with_options presence: true do
    validates :image, :title, :content, :word_name, :example
  end

  def save
    diary = Diary.create(image: image, title: title, content: content, user_id: user_id)
    Word.create(word_name: word_name, example: example, diary_id: diary.id, user_id: user_id)
  end
end
