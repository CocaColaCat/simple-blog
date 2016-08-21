Rails.application.routes.draw do

  resources :sessions, only: [:new, :create]

  # delete 'logout', to: :destroy, controller: 'sessions'
  get 'logout', to: 'sessions#destroy', as: :logout

  resources :articles do
    resources :comments
  end

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
