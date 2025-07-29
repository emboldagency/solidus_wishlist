RSpec.describe Spree::WishedProductsController, type: :controller do
  let(:user)            { create(:user) }
  let!(:wished_product) { create(:wished_product) }
  let(:new_variant)     { create(:variant) }
  let(:attributes)      do
    {
      wishlist_id: wished_product.wishlist.id,
      variant_id: new_variant.id # Use a different variant to avoid duplicates
    }
  end

  before do
    allow(controller).to receive(:spree_current_user).and_return(user)
    # Mock the user wishlist method
    allow(user).to receive(:wishlist).and_return(wished_product.wishlist)
  end

  context '#create' do
    context 'with valid params' do
      it 'creates a new Spree::WishedProduct' do
        expect do
          post :create, params: { wished_product: attributes }
        end.to change(Spree::WishedProduct, :count).by(1)
      end

      it 'assigns a newly created wished_product as @wished_product' do
        post :create, params: { wished_product: attributes }
        expect(assigns(:wished_product)).to be_a Spree::WishedProduct
        expect(assigns(:wished_product)).to be_persisted
      end

      it 'redirects to the created wished_product' do
        post :create, params: { wished_product: attributes }
        expect(response).to redirect_to spree.wishlist_path(Spree::WishedProduct.last.wishlist)
      end

      context 'and product already present in wishlist' do
        let(:wishlist)        { create(:wishlist, user: user) }
        let!(:wished_product) { create(:wished_product, wishlist: wishlist) }
        let(:attributes)      do
          {
            wishlist_id: wishlist.id,
            variant_id: wished_product.variant.id # Use the same variant that's already in the wishlist
          }
        end

        it 'does not save it' do
          expect do
            post :create, params: { wished_product: attributes }
          end.to change(Spree::WishedProduct, :count).by(0)
        end
      end
    end

    context 'with invalid params' do
      it 'raises error' do
        expect { post :create }.to raise_error(ActionController::ParameterMissing)
      end
    end
  end

  context '#update' do
    context 'with valid params' do
      it 'assigns the requested wished_product as @wished_product' do
        put :update, params: { id: wished_product, wished_product: attributes }
        expect(assigns(:wished_product)).to eq wished_product
      end

      it 'redirects to the wished_product' do
        put :update, params: { id: wished_product, wished_product: attributes }
        expect(response).to redirect_to spree.wishlist_path(wished_product.wishlist)
      end
    end

    context 'with invalid params' do
      it 'raises error' do
        expect { put :update }.to raise_error(ActionController::UrlGenerationError)
      end
    end
  end

  context '#destroy' do
    it 'destroys the requested wished_product' do
      expect do
        delete :destroy, params: { id: wished_product }
      end.to change(Spree::WishedProduct, :count).by(-1)
    end

    it 'redirects to the wished_products list' do
      delete :destroy, params: { id: wished_product }
      expect(response).to redirect_to spree.wishlist_path(wished_product.wishlist)
    end

    it 'requires the :id parameter' do
      expect { delete :destroy }.to raise_error(ActionController::UrlGenerationError)
    end
  end
end
