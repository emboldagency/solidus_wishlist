FactoryBot.define do
  factory :product, class: 'Spree::Product' do
    name { FFaker::Product.product_name }
    description { FFaker::Lorem.paragraph }
    price { 19.99 }
    cost_price { 17.00 }
    sku { FFaker::Product.model }
    available_on { 1.year.ago }
    deleted_at { nil }
    shipping_category { Spree::ShippingCategory.first || create(:shipping_category) }

    # ensure product has a master variant
    after(:create) { |p| p.reload }
  end

  factory :custom_product, class: 'Spree::Product' do
    name { 'Custom Product' }
    price { 17.99 }
  end

  factory :product_with_seo, parent: :product do
    meta_description { 'Test description' }
    meta_keywords { 'test, meta, keywords' }
  end
end
