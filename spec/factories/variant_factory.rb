FactoryBot.define do
  factory :variant, class: 'Spree::Variant' do
    sku { FFaker::Product.model }
    weight { 0 }
    height { 0 }
    width  { 0 }
    depth  { 0 }
    is_master { false }
    cost_price { 17.00 }
    price { 19.99 }

    # we need to have a product with a master variant as well
    before(:create) { |variant| variant.product || variant.product = create(:product) }
  end

  factory :master_variant, parent: :variant do
    is_master { true }
  end

  factory :on_demand_variant, parent: :variant do
    track_inventory { false }
  end
end
