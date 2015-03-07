Rails.application.routes.draw do
  root 'root#index'

  scope module: :juices do
    scope module: :ingredients do
      resources :ingredients, only: :index
    end

    scope module: :categories do
      resources :categories, only: :index
    end
  end

  scope module: :offer_requests do
    resources :offer_requests, only: :index
    
    scope module: :deliveries do
      resources :deliveries, only: :index
    end
  end
end
