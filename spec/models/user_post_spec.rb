require 'rails_helper'

RSpec.describe UserPost, type: :model do
  before do
    @user_post = FactoryBot.build(:user_post)
  end
  
  describe '新規投稿情報の保存' do
    context '新規投稿情報が保存できる場合' do
      it '全ての値が入力されていれば保存できる' do
        expect(@user_post).to be_valid
      end
    end

    context '新規投稿情報が保存できない場合' do
      
    end
  end 



end
