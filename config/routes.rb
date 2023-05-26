Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :foods, except: [:edit, :update, :show]
  resources :recipes, except: :edit
  resources :public_recipes, only: %i[index]

  # Defines the root path route ("/")
  authenticated :user do
    root to: 'foods#index', as: :authenticated_root
  end

  devise_scope :user do
    root to: 'devise/sessions#new'
  end
end
