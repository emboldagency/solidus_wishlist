module Spree
  module UserDecorator
    extend ActiveSupport::Concern

    included do
      has_many :wishlists, class_name: 'Spree::Wishlist'
    end

    def wishlist
      default_wishlist = wishlists.where(is_default: true).first
      default_wishlist ||= wishlists.first
      default_wishlist ||= wishlists.create(name: I18n.t('spree.wishlist.default_wishlist_name'), is_default: true)
      default_wishlist.update_attribute(:is_default, true) unless default_wishlist.is_default?
      default_wishlist
    end
  end
end

# Try to load the user class and include the decorator
if defined?(Spree) && Spree.respond_to?(:user_class)
  Spree.user_class.include Spree::UserDecorator
elsif defined?(Spree::User)
  Spree::User.include Spree::UserDecorator
end
