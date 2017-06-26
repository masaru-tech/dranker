Rails.application.routes.draw do
  get 'top/index'

  namespace :admin do
    resources :alcohols
    resources :checkins
    resources :places
    resources :users
    resources :sakes
    resources :sake_infos

    namespace :acts_as_taggable_on do
      resources :tags
      resources :taggings
    end

    root to: "sakes#index"
  end

  resources :sessions, only: %i(new create)

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    get  'places' => 'places#index'
    post 'places' => 'places#create'

    get 'sakes' => 'sakes#index'
    get 'sakes/:id' => 'sakes#show'

    post 'users' => 'users#create'

    get 'checkins' => 'checkins#index'
    post 'checkins/add'
  end
end
