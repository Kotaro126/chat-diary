class DiariesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  #新規投稿フォームへ遷移するnewアクション
  def new
    @user_post = UserPost.new
  end

  #トップページに日記投稿内容を一覧表示する際のindexアクション
  def index
    @diaries = Diary.order('created_at DESC')
  end

  #新規投稿フォームから投稿するcreateアクション
  def create
    @user_post = UserPost.new(post_params)
    if @user_post.valid?
      @user_post.save
      redirect_to root_path
    else
      render action: :new
    end
  end
  
  def show
    @diary = Diary.find(params[:id])
  end

  private
  def post_params
    params.require(:user_post).permit(:image, :title, :content, :word_name, :example, :diary_id, :user_id).merge(user_id: current_user.id)
  end
end