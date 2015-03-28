module Morphing
  module ApplicationHelper
    def morphed_from
      @morphed_from ||= User.find(session[:morphed_from].last)
    end

    def morphed?
      # binding.pry
      session[:morphed_from].present?
    end
  end
end
