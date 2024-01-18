class Item < ApplicationRecord
  validates :image, presence: true, unless: :was_attached?
  validates :product_name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :delivery_time_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :price, presence: true, numericality: { only_integer: true, message: 'is not a number' }

  belongs_to :user


  belongs_to :user
  has_one_attached :image

  def was_attached?
    self.image.attached?
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :delivery_time
  belongs_to :prefecture
end
