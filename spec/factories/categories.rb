FactoryBot.define do
  factory :category do
    category_name                    {"メンズ"}

    #trait :with_goods do
      #after(:create) do |category|
        #create_list(:post, 3, category: category)
      #end
    #end
    #id                               {1}
  end
end
