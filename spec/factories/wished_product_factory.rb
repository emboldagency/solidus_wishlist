FactoryBot.define do
  factory :wished_product, class: Spree::WishedProduct do
    association :variant
    association :wishlist
    remark { 'Some remark..' }
    quantity { 1 }
  end
end
