class Item < ApplicationRecord
  validates :image, presence: true, unless: :was_attached?
  validates :product_name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :category_id, numericality: { other_than: 1, message: "を入力してください。" }
  validates :condition_id, numericality: { other_than: 1, message: "を入力してください。"}
  validates :delivery_charge_id, numericality: { other_than: 1, message: "を入力してください。" }
  validates :prefecture_id, numericality: { other_than: 1, message: "を入力してください。" }
  validates :delivery_time_id, numericality: { other_than: 1, message: "を入力してください。" }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "は半角数字で入力してください。" }

  belongs_to :user
  has_one :order
  has_one_attached :image

  def was_attached?
    image.attached?
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :delivery_time
  belongs_to :prefecture
end
