module Morphing
  class MorphingController < ApplicationController
    def morph
      morph_to = User.find(params[:id])
      session[:morphed_from] ||= []
      session[:morphed_from] << current_user.id
      sign_in(:user, morph_to)

      flash[:success] = "Morphed into #{morph_to.name}"
      redirect_back_or_to_root
    end

    def unmorph
      previous_morph = session[:morphed_from].last
      if morph_from = User.find_by(id: previous_morph)
        session[:morphed_from].delete(morph_from.id)
        sign_in :user, morph_from
      end

      redirect_back_or_to_root
    end
  end
end
