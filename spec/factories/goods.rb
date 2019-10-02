FactoryBot.define do
  factory :good do
    goods_name                    {"Tシャツ"}
    goods_description             {"ぜひご検討ください。"}
    category_id                   {1}
    size                          {"FREE SIZE"}
    brand_id                      {1}
    condition_id                  {1}
    delivery_id                   {1}
    prefecture_id                 {1}
    shipment_id                   {1}
    price                         {300}
    user_id                       {1}
  end
end
