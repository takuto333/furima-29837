FactoryBot.define do
  factory :order_address do
    postal_code   { Faker::Number.number(digits: 7).to_s.insert(3, '-') }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    municipality  { Gimei.city.kanji }
    address       { Gimei.town.kanji << Faker::Number.number(digits: 1).to_s << '-' << Faker::Number.number(digits: 2).to_s }
    building_name { Gimei.town.kanji << Faker::Number.number(digits: 3).to_s }
    phone_number  { Faker::Number.number(digits: 11) }
  end
end
