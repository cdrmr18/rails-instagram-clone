class PostsController < ApplicationController
  def index
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to post_path(@post)
    else
      redirect_to authenticated_root_path, status: :unprocessable_entity, alert: @post.errors.full_messages
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
  end

  def destroy

  end

  private

  def post_params
    params.require(:post).permit(:caption, :longitude, :latitude, :allow_comments, :show_likes_count, photos: [])
  end
end
