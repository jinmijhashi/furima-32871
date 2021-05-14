FactoryBot.define do
  factory :item do
    title { '服' }
    text { '新品未使用' }
    category_id { 3 }
    status_id { 2 }
    shipping_id { 3 }
    shipping_area_id { 4 }
    days_to_ship_id { 2 }
    price { 1000 }
    association :user
    after(:build) do |items|
      items.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
