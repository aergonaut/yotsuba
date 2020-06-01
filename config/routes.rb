# typed: strict
Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"

  resource :session, only: [:new, :create, :destroy] do
    member do
      get "logout" => "sessions#destroy"
    end
  end
  resources :users, only: [:new, :create, :edit, :update]

  resources :tokens, only: [:create]

  root to: "dashboard#index"
  get "/search" => "dashboard#index"
  get "/items/:slug" => "dashboard#index"
end
