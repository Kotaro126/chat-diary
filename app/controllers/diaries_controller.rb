class DiariesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_diary, only: [:show, :edit, :destroy]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @diaries = Diary.order('created_at DESC')
  end

  def new
    @user_post = UserPost.new
  end

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
  end

  def edit
    redirect_to action: :index unless current_user.id == @diary.user_id
  end

  def update
    diary = Diary.find(params[:id])
    diary_params = params.permit(:image, :title, :content, :user_id)
    if diary.update!(diary_params)
      redirect_to diary_path, notice: 'Book was successfully updated.'
    else
      render :edit, notice: 'update was failed'
    end
  end

  def destroy
    if user_signed_in? && current_user.id == @diary.user_id
      @diary.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def search
    @diaries = Diary.search(params[:keyword])
  end

  private
  def post_params
    params.require(:user_post).permit(:image, :title, :content, :word_name, :example, :diary_id, :user_id).merge(user_id: current_user.id)
  end

  def diary_params
    params.require(:diary).permit(:image, :title, :content).merge(user_id: current_user.id)
  end

  def set_diary
    @diary = Diary.find(params[:id])
    @word = Word.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end