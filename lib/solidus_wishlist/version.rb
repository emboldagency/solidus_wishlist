module SolidusWishlist
  module_function

  # Returns the version of the currently loaded SolidusWishlist as a
  # <tt>Gem::Version</tt>.
  def version
    Gem::Version.new VERSION::STRING
  end

  module VERSION
    MAJOR = 2
    MINOR = 2
    TINY  = 0
    PRE   = 'embold.1'

    STRING = [MAJOR, MINOR, TINY].join('.') + (PRE ? "-#{PRE}" : "")  end
end
