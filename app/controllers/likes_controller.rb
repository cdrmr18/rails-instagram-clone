class LikesController < ApplicationController
  before_action :set_post

  def toggle_like
    @like = @post.likes.find_by(user: current_user)
    if @like
      @like.destroy
    else
      Like.create(user: current_user, post: @post)
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
