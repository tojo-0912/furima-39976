FactoryBot.define do
  factory :item do
    association :user

    item_name          { Faker::Name.initials }
    item_description   { Faker::Lorem.sentence }
    category_id        { 2 }
    state_id           { 2 }
    shipping_charge_id { 2 }
    shipment_region_id { 2 }
    days_to_ship_id    { 2 }
    price              { Faker::Number.between(from: 300, to: 9_999_999) }

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end