module ActionDispatch::Routing
  class Mapper
    def morphing_for(options = {})
      controller_name = options[:controller] || 'morphing/morphing'

      get '/morph/:id'    => "#{controller_name}#morph", as: :morph
      get '/unmorph'      => "#{controller_name}#unmorph", as: :unmorph
    end
  end
end
