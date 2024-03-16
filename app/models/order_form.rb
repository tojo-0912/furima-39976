class OrderForm
  include ActiveModel::Model
 
  attr_accessor :user_id, :item_id, :postal_code, :shipment_region_id, :city, :house_number, :building_name, :phone_number, :token

  with_options presence: true do
  validates :user_id
  validates :item_id
  validates :postal_code,              format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
  validates :shipment_region_id,       numericality: { other_than: 1, message: "Prefecture can't be blank" }
  validates :city
  validates :house_number
  validates :phone_number,             format: { with: /\A\d{10}\z|\A\d{11}\z/, message: 'is invalid' }
  validates :token
  end
  
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    address = Address.create(postal_code: postal_code, shipment_region_id: shipment_region_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
 end