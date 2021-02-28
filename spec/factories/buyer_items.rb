FactoryBot.define do
  factory :buyer_item do
    factory :buyer do
      phone_number                { 10.times.map { SecureRandom.random_number(10) }.join.to_s }
      postal_code                 { 7.times.map { SecureRandom.random_number(10) }.join.to_s }
      prefecture_id               { Random.rand(2..48) }
      city                        { 'あアｱ亜' + Gimei.address.city.kanji }
      house_number                { 'あアｱ亜1１' + Faker::Lorem.sentence }
      building_name               { 'あアｱ亜aAａＡ' + Faker::Lorem.sentence }
      token                       { 'tok_abcdefghijk00000000000000000' }
    end
  end
end
