class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :last_name_kanji, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角を使用してください"}
    validates :first_name_kanji, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角を使用してください"}
    validates :last_name_katakana, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カナを使用してください"}
    validates :first_name_katakana, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カナを使用してください"}
    validates :birthday
  end       
end
