Releasely::Application.routes.draw do
  get :healthcheck, to: 'healthcheck#index'
end
