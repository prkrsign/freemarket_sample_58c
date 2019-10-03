FactoryBot.define do
  factory :address do
      family_name                   {"田中"}
      first_name                    {"敦彦"}
      family_name_kana              {"タナカ"}
      first_name_kana               {"アツヒコ"}
      postalcode                    {"129-2325"}
      city                          {"渋谷区"}
      house_number                  {"神南4丁目23-11"}
      building_name                 {"フレームビル4F"}
      user_id                       {1}   
      prefecture_id                 {30}
      phone_number                  {'09087786545'}
  end
end
