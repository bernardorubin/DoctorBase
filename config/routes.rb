Rails.application.routes.draw do
  get 'profile' => 'profile#index'
patch 'profile' => 'profile#update'



  get 'home/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get '/' => 'home#index', as: 'root'
    resources :patients
    resources :appointments
end
