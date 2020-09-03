class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index,:create]
  before_action :sold_out, only: [:index,:create]
  before_action :set_item, only: [:index,:create]
  def index 
    @order = OrderAddress.new
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:item_id, :token, :postal_cord, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

  def sold_out
    @item = Item.find(params[:item_id])
    if @item.order != nil
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end