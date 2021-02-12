Releasely::Application.routes.draw do
  resources :components
  resources :issues
  resources :products
  resources :release_versions
  resources :releases
  resources :sub_components
  resources :teams
  resources :test_configs
  resources :test_splits
  resources :test_results
  resources :users
end
