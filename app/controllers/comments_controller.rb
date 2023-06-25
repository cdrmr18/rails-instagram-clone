class CommentsController < ApplicationController
  before_action :set_post, only: [:create]

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            "post#{@post.id}comments",
            partial: 'posts/post_comments',
            locals: {post: @post}
          )
        end
      end
    else
      redirect_to post_path(@post), status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user == current_user
      @comment.destroy
    end
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
