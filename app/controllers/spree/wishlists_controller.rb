# frozen_string_literal: true

module Spree
  class WishlistsController < Spree::BaseController
    helper "spree/products"

    before_action :find_wishlist, only: %i[destroy show update edit]

    respond_to :html
    respond_to :js, only: :update

    def index
      @wishlists = spree_current_user.wishlists
      respond_with(@wishlists)
    end

    def show
      respond_with(@wishlist)
    end

    def new
      @wishlist = Spree::Wishlist.new
      respond_with(@wishlist)
    end

    def edit
      respond_with(@wishlist)
    end

    def create
      @wishlist = Spree::Wishlist.new wishlist_attributes
      @wishlist.user = spree_current_user
      @wishlist.save
      respond_with(@wishlist)
    end

    def update
      @wishlist.update wishlist_attributes
      respond_with(@wishlist)
    end

    def default
      @wishlist = spree_current_user.wishlist
      respond_with(@wishlist) do |format|
        format.html { render :show }
      end
    end

    def destroy
      @wishlist.destroy
      respond_with(@wishlist) do |format|
        format.html { redirect_to "/account" }
      end
    end

    private

    def wishlist_attributes
      params.require(:wishlist).permit(:name, :is_default, :is_private)
    end

    # Isolate this method so it can be overwritten
    def find_wishlist
      @wishlist = Spree::Wishlist.find_by!(access_hash: params[:id])
      authorize! params[:action].to_sym, @wishlist
    end
  end
end
