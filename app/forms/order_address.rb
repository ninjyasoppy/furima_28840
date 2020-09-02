class OrderAddress

  include ActiveModel::Model

  attr_accessor :postal_cord, :prefecture_id, :city, :addresses, :building, :phone_number, :token, :item_id, :user_id

  

 #バリデーション書く予定

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_cord: postal_cord, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order.id)
  end
end