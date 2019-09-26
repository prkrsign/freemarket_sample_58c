FactoryBot.define do
  factory :sns_credential do
    provider { "MyString" }
    uid { "MyString" }
    user_id { "" }
  end
end
