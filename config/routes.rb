Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    get 'sakes' => 'sakes#index'
    get 'sakes/:id' => 'sakes#show'

    post 'users' => 'users#create'

    post 'checkins/add'
  end
end
