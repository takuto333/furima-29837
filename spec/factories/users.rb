FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6, mix_case: true) }
    password_confirmation { password }
    last_name_kanji       { Gimei.last.kanji }
    first_name_kanji      { Gimei.first.kanji }
    last_name_katakana    {Gimei.last.katakana}
    first_name_katakana   {Gimei.first.katakana}
    birthday              {Faker::Date.between(from: '1930-01-01', to: '2015-12-31')}
  end
end
