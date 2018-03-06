class CommentsController < ApplicationController
  before_action :require_sign_in

  def create
    @post = Post.find(params[:post_id])
    comment = @post.comments.new(comment_params)
    comment.user = current_user

    if comment.save
      FavoriteMailer.new_comment(comment.user, @post, comment).deliver_now
      flash[:notice] = "Comment saved succesfully"
      redirect_to [@post.topic, @post]
    else
      flash[:alert] = "Comment failed to save."
      redirect_to [@post.topic, @post]
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    comment = @post.comments.find(params[:id])

    if comment.destroy
      flash[:notice] = "Comment deleted succesfully"
      redirect_to [@post.topic, @post]
    else
      flash[:alert] = "Comment couldn't be deleted, try again."
      redirect_to [@post.topic, @post]
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def authorize_user
    comment = Comment.find(params[:id])
    unless current_user == comment.user || current_user.admin?
      flash[:alert] = "You do not have permission to delete a comment."
      redirect_to [comment.post.topic, comment.post]
    end
  end
end
