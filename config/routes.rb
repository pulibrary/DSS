Rails.application.routes.draw do

  mount Blacklight::Engine => '/'
  root to: 'catalog#index'
  concern :searchable, Blacklight::Routes::Searchable.new

  resource :catalog, only: [:index], as: 'catalog', path: '/catalog', controller: 'catalog' do
    concerns :searchable
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  concern :exportable, Blacklight::Routes::Exportable.new

  resources :solr_documents, only: [:show], path: '/catalog', controller: 'catalog' do
    concerns :exportable
  end

  resources :bookmarks do
    concerns :exportable

    collection do
      delete 'clear'
    end
  end

  resources :studies
  resources :data_files
  resources :countries
  resources :regions
  resources :subjects
  resources :resources
  get '/cgi-bin/catalog/search.cgi', to: 'catalog#studylink'
  get '/studynum/:studynum', to: 'studies#number_lookup'
  get '/resources/:id/solr', to: 'resources#solr', defaults: { format: :json }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
