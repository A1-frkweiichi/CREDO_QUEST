Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "home#top"
  get "/home/special_thanks", to: "home#special_thanks", as: "special_thanks"
  get "/home/terms", to: "home#terms", as: "terms"
  get "/home/privacy_policy", to: "home#privacy_policy", as: "privacy_policy"

  get "/auth/:provider/callback", to: "sessions#create"
  get "/auth/failure", to: "sessions#failure"
  delete "/sign_out", to: "sessions#destroy"

  resources :users do
    member do
      get :following, :followers
    end
    resources :another_website_links, only: [:create, :update, :destroy]
  end
  resources :relationships, only: [:create, :destroy]

  resources :todos do
    resource :like, only: [:create, :destroy]
  end
end
