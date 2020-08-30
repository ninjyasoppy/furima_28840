require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item , user_id: user.id)
      @item.image = fixture_file_upload('public/images/test.jpeg')
    end

    it "全てのデータが存在していればデータは保存出来る" do
      expect(@item).to be_valid
    end

    it "画像がないと登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank") 
    end

    it "商品名がないと登録できない" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank") 
    end

    it "商品説明がないと登録できない" do
      @item.text = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank") 
    end

    it "カテゴリーを選択しないと登録できない" do
      @item.category_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1") 
    end

    it "商品の状態を選択しないと登録できない" do
      @item.sales_status_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Sales status must be other than 1") 
    end

    it "配送料の負担を選択しないと登録できない" do
      @item.shipping_fee_status_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee status must be other than 1") 
    end

    it "発送元の地域を選択しないと登録できない" do
      @item.prefecture_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1") 
    end

    it "発送までの日数を選択しないと登録できない" do
      @item.scheduled_delivery_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Scheduled delivery must be other than 1") 
    end

    it "価格の情報がないと登録できない" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank") 
    end

    it "価格の範囲が、¥300以上であること" do
      @item.price = "299"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300") 
    end

    it "価格の範囲が、¥¥9,999,999以下であること" do
    @item.price = "10000000"
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999") 
    end

    it "販売価格は半角数字のみ入力可能であること" do
      @item.price = "３００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number") 
    end

  end
end