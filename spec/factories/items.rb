FactoryBot.define do
  factory :item do
    name                        { 'あアｱ亜aAａＡ' + Faker::Name.initials }
    description                 { 'あアｱ亜aAａＡ' + Faker::Lorem.sentence }
    price                       { Random.rand(300..9_999_999) }
    status_id                   { Random.rand(2..4) }
    condition_id                { Random.rand(2..7) }
    delivery_fee_id             { Random.rand(2..3) }
    category_id                 { Random.rand(2..11) }
    prefecture_id               { Random.rand(2..48) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end
  end
end
