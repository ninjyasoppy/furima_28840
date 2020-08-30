class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  with_options presence: true do
    EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    PASSWORD = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
    NAME = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/
    KANA = /\A[ァ-ヶー－]+\z/
    validates :nickname
    validates :birthday
    validates :email, uniqueness: {case_sensitive: false},format: {with: EMAIL}
    validates :password, length: {minimum: 6},format: {with: PASSWORD}
    validates :password_confirmation
    with_options format: {with: NAME} do
      validates :family_name
      validates :first_name
    end
    with_options format: {with: KANA} do
      validates :family_name_kana
      validates :first_name_kana
    end
  end
end