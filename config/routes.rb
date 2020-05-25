# typed: strict
Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :edit, :update]

  resources :tokens, only: [:create]

  root to: "dashboard#index"
end
