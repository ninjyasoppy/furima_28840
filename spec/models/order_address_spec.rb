require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.build(:item , user_id: user.id)
    item.image = fixture_file_upload('public/images/test.jpeg')
    item.save
    @order_address = FactoryBot.build(:order_address)
    @order_address.item_id = item.id
    @order_address.user_id = user.id
  end
  it "全てのデータが存在していればデータは保存出来る" do
    expect(@order_address).to be_valid
  end

  it "郵便番号がないと登録できない" do
    @order_address.postal_cord = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Postal cord can't be blank")
  end

  it "郵便番号にハイフンが必要" do
    @order_address.postal_cord = "1234567"
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Postal cord is invalid")
  end

  it "都道府県を選択しないと登録できない" do
    @order_address.prefecture_id = "1"
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
  end

  it "市区町村を入力しないと登録できない" do
    @order_address.city = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("City can't be blank")
  end

  it "番地がないと登録できない" do
    @order_address.addresses = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Addresses can't be blank")
  end

  it "建物名がなくても登録できる" do
    @order_address.building = nil
    expect(@order_address).to be_valid
  end
  
  it "電話番号がないと登録できない" do
    @order_address.phone_number = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
  end

  it "tokenがないと登録できない" do
    @order_address.token = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Token can't be blank")
  end
end