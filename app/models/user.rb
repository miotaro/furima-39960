class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birthday, presence: true
  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid. include both letters and numbers' }
  with_options presence: true,
               format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is valid. input full-width characters' } do
    validates :last_name
    validates :first_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶ一]+\z/, message: 'is valid. input full-width katakana characters' } do
    validates :last_name_ruby
    validates :first_name_ruby
  end

  # has_many :items
  # has_many :orders
end
