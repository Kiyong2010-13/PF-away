class Public::CustomersController < ApplicationController
before_action :authenticate_customer!
  def show
    @customer = Customer.find(params[:id])
    @posts = @customer.posts.page(params[:page]).per(3)
    @goods = @customer.goods
  end
  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(current_customer.id), notice: "＊更新が完了しました!"
    else
      render :edit
    end
  end

  def good
    @customer = Customer.find(params[:id])
    @goods = @customer.goods.page(params[:page]).per(15)
  end

  def unsubscribe
    @customer = Customer.find(params[:id])
  end

  def withdraw
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:user_name, :email, :introduction, :favorite_team, :profile_image )
  end
end
