class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index,:create]

  def index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def create#number,exp_month,exp_year,cvc,postal_cord,prefecture_id,city,addresses,building,phone_number,item_id
    @order = Order.new(item_id: order_params[:item_id], user_id: order_params[:user_id])
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params#postal_cord,prefecture_id,city,addresses,building,phone_number,token,item_id
    @item = Item.find(params[:item_id])
    params.permit(:item_id,:token).merge(user_id: current_user.id)
  
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end
end
