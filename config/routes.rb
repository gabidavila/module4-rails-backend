Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :locations, only: [:index]
      get "locations/states", to: "locations#states"
      get "locations/cities", to: "locations#cities"
      resources :users, only: [:create, :update, :show]
        resources :conferences, only: [:index, :show, :create, :update] do
          resources :talks, only: [:index, :show, :create, :update]
      end
    end
  end
end
