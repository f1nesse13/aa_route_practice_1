Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :cats do
    resources :toys, only: [:index]
  end
  resources :toys, only: [:create, :update, :show, :destroy]
end
