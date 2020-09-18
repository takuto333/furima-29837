class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'please set including both half-width letters and numbers' }
    validates :last_name_kanji, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Please use full-width-letter' }
    validates :first_name_kanji, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Please use full-width-letter' }
    validates :last_name_katakana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Please use full-width-kana'}
    validates :first_name_katakana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Please use full-width-kana'}
    validates :birthday
  end
end
