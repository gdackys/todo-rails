Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "todo_lists#index"

  resources :todo_lists do
    resources :todo_items do
      member do
        patch :toggle
      end
    end
  end
end
