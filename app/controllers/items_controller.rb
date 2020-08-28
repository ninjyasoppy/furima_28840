class ItemsController < ApplicationController
  def index
    @item = Item.all
  end

  def new
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
