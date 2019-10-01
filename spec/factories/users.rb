FactoryBot.define do
  factory :user do
      username                   {"testman"}
      email                      {"kkk@gmail.com"}
      password                   {"00000000"}
      password_confirmation      {"00000000"}
      family_name                {"田中"}
      first_name                 {"太郎"}
      family_name_in_katakana    {"タナカ"}
      first_name_in_katakana     {"タロウ"}
      birth_year                 {1990}
      birth_month                {1}
      birth_day                  {1}
      phone_number               {"09011223456"}
  end
end