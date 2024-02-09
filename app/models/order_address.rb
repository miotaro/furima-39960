class OrderAdress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture, :municipalities, :street_address, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :municipalities
    validates :street_address
    validates :phone_number, numericality: { only_integer: true, \A0[5789]0\d{4}\d{4}\z, message: 'is invalid. Input only number'}, length: {is: 11, message: 'is too short'}
    validates :user_id
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :building_name

  def save
    order = Order.create(address: address, user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, street_address: street_address, building_name: building_name, phone_number: phone_number, order_id: order_id)
end
