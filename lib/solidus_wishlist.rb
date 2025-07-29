# frozen_string_literal: true

require 'solidus_core'
require 'solidus_support'
require 'solidus_wishlist/config'
require 'deface' if SolidusWishlist::Config.use_deface


## Deface overrides are now loaded automatically by Solidus/Deface

require 'solidus_wishlist/engine'
require 'solidus_wishlist/version'
require 'coffee_script'
