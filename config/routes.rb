Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#index'
  resources :advertisements

  get 'categories/:category_name', to: "categories#browse_by_category"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
