module Sinatra
  module ViewHelpers
    VERSION = "0.1.4" unless const_defined?(:VERSION)

    def self.version
      VERSION
    end
  end
end

