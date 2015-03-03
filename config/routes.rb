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
end
