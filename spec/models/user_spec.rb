require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nickname,email,password,password_confirmation,family_name,first_name,family_name_kana,first_name_kane,birthdayが存在すれば登録できること" do
      
    end

    it "nicknameが空では登録できないこと" do

    end

    it "emailが空では登録できないこと" do

    end

    it "passwordが空では登録できないこと" do

    end
    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do

    end

    it "family_nameが空では登録できないこと" do

    end

    it "first_nameが空では登録できないこと" do

    end

    it "family_name_kanaが空では登録できないこと" do

    end

    it "first_name_kaneが空では登録できないこと" do

    end

    it "birthdayが空では登録できないこと" do

    end

    it "passwordが6文字以上であれば登録できること" do

    end

    it "passwordが5文字以下であれば登録できないこと" do

    end

    it "重複したemailが存在する場合登録できないこと" do

    end
  end
end
