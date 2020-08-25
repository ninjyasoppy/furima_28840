class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :text
      t.text :image
      t.string :price
      t.boolean :soldout
      t.string :category_id
      t.string :sales_status_id
      t.string :shipping_fee_status_id
      t.string :prefecture_id
      t.string :scheduled_delivery_id
      t.timestamps
    end
  end
end