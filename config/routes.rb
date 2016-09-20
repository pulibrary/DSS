Rails.application.routes.draw do
  resources :studies
  resources :data_files
  resources :countries
  resources :regions
  resources :subjects
  resources :resources
  get '/resources/:id/solr', to: 'resources#solr', defaults: { format: :json }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
