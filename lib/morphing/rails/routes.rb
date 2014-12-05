module ActionDispatch::Routing
  class Mapper
    def morphing_for
      get '/morph/:id'    => 'morphing/morphing#morph', as: :morph
      get '/unmorph'      => 'morphing/morphing#unmorph', as: :unmorph
    end
  end
end
