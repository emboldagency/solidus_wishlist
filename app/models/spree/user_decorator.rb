Spree.user_class.class_eval do
  has_many :wishlists, class_name: 'Spree::Wishlist'

  def wishlist
    default_wishlist = wishlists.where(is_default: true).first
    default_wishlist ||= wishlists.first
    default_wishlist ||= wishlists.create(name: I18n.t('spree.wishlist.default_wishlist_name'), is_default: true)
    default_wishlist.update_attribute(:is_default, true) unless default_wishlist.is_default?
    default_wishlist
  end
end

module Spree
  module UserDecorator
    def wishlist
      default_wishlist = wishlists.where(is_default: true).first
      default_wishlist ||= wishlists.first
      default_wishlist ||= wishlists.create(name: I18n.t('spree.wishlist.default_wishlist_name'), is_default: true)
      default_wishlist.update_attribute(:is_default, true) unless default_wishlist.is_default?
      default_wishlist
    end
  end
end

Spree.user_class.class_eval do
  has_many :wishlists, class_name: 'Spree::Wishlist'
  prepend Spree::UserDecorator
end
