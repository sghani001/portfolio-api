Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'

  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # Auth
      post 'auth/sign_in', to: 'auth#sign_in'
      get 'auth/me', to: 'auth#me'

      # Profile
      get 'profile', to: 'profile#show'
      put 'profile', to: 'profile#update'

      # Projects
      resources :projects, only: [:index, :show, :create, :update, :destroy]

      # Experiences
      resources :experiences, only: [:index, :show, :create, :update, :destroy]

      # Education
      resources :educations, only: [:index, :show, :create, :update, :destroy]

      # Gems
      get 'gems', to: 'gems#index'

      # Contact
      post 'contact', to: 'contacts#create'

      # Health
      get 'health', to: 'health#show'
    end
  end
end