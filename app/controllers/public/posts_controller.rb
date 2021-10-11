class Public::PostsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @posts = Post.all.page(params[:page]).per(15)
    @search = Post.ransack(params[:q])
    @posts = @search.result.page(params[:page]).per(15)
  end

  def new
    @post = Post.new
    @genres = Genre.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    if @post.save
      redirect_to posts_path
    else
      @genres = Genre.all
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @genres = Genre.all
  end

  def update
    @post = Post.find(params[:id])
    @post.customer_id = current_customer.id
    if @post.update(post_params)
      redirect_to post_path
    else
      @genres = Genre.all
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :genre_id, :id, :post_image)
  end
end
