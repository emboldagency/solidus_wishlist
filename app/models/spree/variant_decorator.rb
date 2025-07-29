
module Spree
  module VariantDecorator
    def self.prepended(base)
      base.has_many :wished_products, dependent: :destroy
    end
  end
end

Spree::Variant.prepend Spree::VariantDecorator
