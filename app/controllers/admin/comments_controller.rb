class Admin::CommentsController < ApplicationController
  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_post_path(@post.id), notice:"※コメントを削除しました。"
  end
  
  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
