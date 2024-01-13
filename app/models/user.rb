class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birthday, presence: true
  validates :password, presence: true, format: { with: /\A(?=.*[a-zA-Z])(?=.*[0-9])/, message: "is invalid. include both letters and numbers" }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "is valid. input full-width characters" }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "is valid. input full-width characters" }
  validates :last_name_ruby, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "is valid. input full-width katakana characters" }
  validates :first_name_ruby, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "is valid. input full-width katakana characters" }

  has_many :items
  has_many :orders
end
 