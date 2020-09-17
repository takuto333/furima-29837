class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :last_name_kanji
    validates :first_name_kanji
    validates :last_name_katakana
    validates :first_name_katakana
    validates :birthday
  end       
end
