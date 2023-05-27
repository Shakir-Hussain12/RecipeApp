Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :foods, except: [:edit, :update, :show]
  resources :recipes, except: :edit do
    resources :public_recipes, only: %i[new create def destroy]
  end
  resources :public_recipes, only: %i[index]

  get '/general_shopping_list', to: 'foods#general_shopping_list', as: :general_shopping_list
  
  # Defines the root path route ("/")
  authenticated :user do
    root 'recipes#index', as: :authenticated_root
  end

  devise_scope :user do
    root to: 'devise/sessions#new'
  end
end
