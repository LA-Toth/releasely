Releasely::Application.routes.draw do
  resources :products
  resources :release_versions
  resources :teams
  resources :test_configs
  resources :users
end
