class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shippig_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery
end