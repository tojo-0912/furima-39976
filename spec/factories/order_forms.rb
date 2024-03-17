FactoryBot.define do
  factory :order_form do
    postal_code           { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    shipment_region_id    { Faker::Number.between(from: 1, to: 47) }
    city                  { Faker::Address.city }
    house_number          { Faker::Address.street_address }
    building_name         { Faker::Address.street_address }
    phone_number          { Faker::Number.decimal_part(digits: 11) }
    token                 {"tok_abcdefghijk00000000000000000"}
  end
end