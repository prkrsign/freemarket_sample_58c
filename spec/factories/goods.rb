FactoryBot.define do
  factory :good, class: Good do
    goods_name                    { Faker::Lorem.characters(number: 40) }
    goods_description             { Faker::Lorem.characters(number: 1000) }
    category_id                   { 1 }
    size                          { }
    brand_id                      { 1 }
    condition_id                  { 1 }
    delivery_id                   { 1 }
    prefecture_id                 { 1 }
    shipment_id                   { 1 }
    price                         { 300 }
    user_id                       { 1 }

    association :category
    delivery
    user
  end

end
