module Morphing
  class MorphingController < ApplicationController
    def morph
      morph_to = User.find(params[:id])
      session[:morphed_from] ||= current_user.id
      sign_in(:user, morph_to)

      flash[:success] = "Morphed into #{morph_to.name}"
      redirect_back_or_to_root
    end

    def unmorph
      if morph_from = User.find_by_id(session[:morphed_from])
        session.delete :morphed_from
        sign_in :user, morph_from
      end

      redirect_back_or_to_root
    end
  end
end
