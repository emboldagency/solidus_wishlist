RSpec.describe Spree::User do
  before do
    # Force decorator inclusion
    unless Spree.user_class.included_modules.include?(Spree::UserDecorator)
      Spree.user_class.include Spree::UserDecorator
    end
  end

  describe 'associations' do
    it 'has many wishlists' do
      association = Spree.user_class.reflect_on_association(:wishlists)
      expect(association).not_to be_nil
      expect(association.macro).to eq(:has_many)
      expect(association.class_name).to eq('Spree::Wishlist')
    end
  end

  it 'has a valid factory' do
    user = create(:user)
    expect(user).to be_valid
  end
end
