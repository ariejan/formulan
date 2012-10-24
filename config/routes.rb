Formulan::Engine.routes.draw do
  get  '/:identifier' => 'forms#new',           as: 'formulan'
  post '/:identifier' => 'forms#create'
  get  '/:identifier/thanks' => 'forms#thanks', as: 'formulan_thanks'
end
