Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :locations, only: [:index]
      get "locations/states", to: "locations#states"
      get "locations/states/:state/cities", to: "locations#cities"
      get "talks", to: "talks#show_all"
      get "talks/topics", to: "talks#topics"
      resources :users, only: [:create, :update, :show]
      get "conferences/states", to: "conferences#states"
      get "conferences/states/:state/cities", to: "conferences#cities"
      resources :conferences, only: [:index, :show, :create, :update] do
        resources :talks, only: [:index, :show, :create, :update]
      end
    end
  end
end
