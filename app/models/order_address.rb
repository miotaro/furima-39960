class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipalities, :street_address, :building_name, :phone_number, :user_id, :item_id,
                :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "は3桁-4桁の半角数字で入力してください。" }
    validates :municipalities
    validates :street_address
    validates :phone_number, numericality: { only_integer: true, message: "は半角数字で入力してください。" },
                             length: { minimum: 10, maximum: 11, message: "が短いです。10~11桁で入力してください。" }
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "を入力してください。" }

  def save
    order = Order.create(user_id:, item_id:)
    Address.create(post_code:, prefecture_id:, municipalities:,
                   street_address:, building_name:, phone_number:, order_id: order[:id])
  end
end
