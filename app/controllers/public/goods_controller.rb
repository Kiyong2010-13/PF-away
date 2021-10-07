class Public::GoodsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    good = @post.goods.new(customer_id: current_customer.id)
    good.save
    flash[:success] = "Liked post"
    redirect_to post_path(@post.id), notice:"いいねを押しました。"
  end

  def destroy
    @post = Post.find(params[:post_id])
    good = @post.goods.find_by(customer_id: current_customer.id)
    good.destroy
    redirect_to post_path(@post.id), notice:"いいねを取り消しました。"
  end
end
