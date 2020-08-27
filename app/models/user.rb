class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :nickname, presence: true
    validates :birthday, presence: true
    # validates :email, presence: true, uniqueness: {case_sensitive: false}, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
    validates :password, presence: true, length: {minimum: 6}
    # validates :first_name, presence: true,  format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/} 
    # validates :last_name, presence: true, format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/} 
    # validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
    # validates :last_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}

end

# devise :database_authenticatable, :registerable,
# :recoverable, :rememberable, :validatable
# with_options presence: true do
# validates :nickname
# validates :birthday
# validates :email,    uniqueness: {case_sensitive: false},
#                  format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
# validates :password, length: {minimum: 7}

# with_options format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/} do
# validates :first_name
# validates :last_name
# end

# with_options format: {with: /\A[ァ-ヶー－]+\z/} do
# validates :first_name_kana
# validates :last_name_kana
# end
# end