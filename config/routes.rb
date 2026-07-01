Rails.application.routes.draw do
  # API documentation (Swagger UI)
  mount Rswag::Ui::Engine => '/api-docs'

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # API v1 routes
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'health', to: 'health#show'
      get 'gems', to: 'gems#index'
      post 'contact', to: 'contacts#create'
    end
  end
end
