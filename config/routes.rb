Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :campers, only: [:create, :index, :show] do
    resources :activities, only: [:index, :show]
  end

  resources :activities, only: [:index, :destroy] do
    resources :signups, only: [:show, :destroy]
  end

  resources :signups, only: [:create] do
    resources :activities, only: [:index, :show, :create]
  end

end
