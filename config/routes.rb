Morphing::Engine.routes.draw do
  get 'morph/:id' => 'morphing#morph', as: :morph
  get 'unmorph'   => 'morphing#unmorph', as: :unmorph
end
