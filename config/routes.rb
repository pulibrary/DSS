Rails.application.routes.draw do

  mount Blacklight::Engine => 'catalog'

  constraints(subdomain: 'dss-staging') do
    root to: redirect('https://library-staging.princeton.edu/dss'), as: :staging_root
    get '/computing', to: redirect('https://library-staging.princeton.edu/dss/computing')
    get '/consultants', to: redirect('https://library-staging.princeton.edu/dss/consultants')
    get '/specialists', to: redirect('https://library-staging.princeton.edu/dss/specialists')
  end
  root to: redirect('https://library.princeton.edu/dss')
  get '/computing', to: redirect('https://library.princeton.edu/dss/computing')
  get '/consultants', to: redirect('https://library.princeton.edu/dss/consultants')
  get '/specialists', to: redirect('https://library.princeton.edu/dss/specialists')

  concern :searchable, Blacklight::Routes::Searchable.new

  resource :catalog, only: [:index], as: 'catalog', path: '/catalog', controller: 'catalog' do
    concerns :searchable
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end
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
