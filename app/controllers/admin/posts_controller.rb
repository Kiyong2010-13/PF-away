class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @posts = Post.all.page(params[:page]).per(15)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path, notice:"※投稿データを削除しました。"
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :genre_id, :id, :post_image)
  end
end
