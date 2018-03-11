Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "devise_sessions", registrations: "devise_registrations" }
  devise_scope :user do
    get 'users/edit/delete', to: "devise_registrations#edit_destroy", as: "edit_user_registration_delete"
    get 'users/edit/password', to: "devise_registrations#edit_password", as: "edit_user_registration_password"
  end
  get 'users/edit/appearance', to: "user_profiles#edit", as: "edit_user_profile"

  root to: 'pages#index'
  resources :advertisements do
    member do
      get 'preview', to: 'preview'
    end
  end

  resources :users, only: [:show]

  get 'categories/:category_name', to: "browse#by_category"
  get 'search', to: "browse#by_search"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
