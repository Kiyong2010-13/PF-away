class Public::CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.customer_id = current_customer.id
    if @comment.save
      redirect_to post_path(@post.id)
    else
      redirect_to post_path(@post.id), notice:"※空白コメントは無効です。"
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post.id), notice:"※コメントを削除しました。"
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
