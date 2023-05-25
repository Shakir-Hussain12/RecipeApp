Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :foods, only: %i[index new create delete]
  resources :recipes, only: %i[index new create]

  # Defines the root path route ("/")
  authenticated :user do
    root to: 'recipes#index', as: :authenticated_root
  end

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

end
