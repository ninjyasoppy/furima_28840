class OrderAddress

  include ActiveModel::Model
  attr_accessor :postal_cord, :prefecture_id, :city, :addresses, :building, :phone_number, :token, :item_id, :user_id

  with_options presence: true do
    validates :postal_cord, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1}
    validates :city
    validates :addresses
    validates :phone_number, length: {maximum: 11}, format: {with: /\A[0-9]+\z/}
    validates :token
    validates :item_id
    validates :user_id
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_cord: postal_cord, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order.id)
  end
end