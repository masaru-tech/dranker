Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  resources :sessions, only: %i(new create)
  delete 'sign_out', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    post 'places' => 'places#create'

    get 'sakes' => 'sakes#index'
    get 'sakes/:id' => 'sakes#show'

    post 'users' => 'users#create'

    get 'checkins' => 'checkins#index'
    post 'checkins/add'
  end
end
