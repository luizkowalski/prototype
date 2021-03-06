Rails.application.routes.draw do
  resources :messages, only: [:create]

  resources :rooms, only: [:index, :show] do
    get 'transcript', on: :member
  end
  post 'rooms/jump', to: 'rooms#jump'

  resources :sessions

  get 'logout' => 'sessions#destroy', :as => 'logout'
  get '/auth/:provider/callback', to: 'sessions#create'

  get 'dashboard' => 'dashboard#index', :as => 'dashboard'
  get 'dashboard/clear_cache', to: 'dashboard#clear_cache', as: 'dashboard_clear_cache'
  post 'dashboard/drop_room', to: 'dashboard#drop_room', as: 'dashboard_drop_room'

  root to: 'home#index'
end
