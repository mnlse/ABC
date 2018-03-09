Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#index'
  resources :advertisements do
    member do
      get 'preview', to: 'preview'
    end
  end

  get 'categories/:category_name', to: "browse#by_category"
  get 'search', to: "browse#by_search"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
