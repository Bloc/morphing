require 'morphing/rails/routes'

module Morphing
  class Engine < ::Rails::Engine
    config.morphing = Morphing
  end
end
