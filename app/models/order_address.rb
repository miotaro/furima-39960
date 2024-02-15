class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipalities, :street_address, :building_name, :phone_number, :user_id, :item_id,
                :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :municipalities
    validates :street_address
    validates :phone_number, numericality: { only_integer: true, message: 'is invalid. Input only number' },
                             length: { minimum: 10, message: 'is too short' }
    validates :user_id
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id:, item_id:)
    Address.create(post_code:, prefecture_id:, municipalities:,
                   street_address:, building_name:, phone_number:, order_id: order[:id])
  end
end
