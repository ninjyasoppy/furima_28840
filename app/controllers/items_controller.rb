class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new ,:create]
  def index
    @item = Item.all
  end

  def new
    redirect_to controller: :devise, action: :new unless user_signed_in?
    @item = Item.new
  end
  def create
    Item.create(item_params)
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :email, :price, :text, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id)
  end
end
