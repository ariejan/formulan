Formulan::Engine.routes.draw do
  get  '/:identifier' => 'formulan/forms#new',           as: 'formulan'
  post '/:identifier' => 'formulan/forms#create',        as: 'post_formulan'
  get  '/:identifier/thanks' => 'formulan/forms#thanks', as: 'formulan_thanks'
end
