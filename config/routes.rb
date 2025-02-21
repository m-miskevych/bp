Rails.application.routes.draw do
  scope "(:locale)", locale: /en|sk/ do
    devise_for :users
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
    # Can be used by load balancers and uptime monitors to verify that the app is live.
    get "up" => "rails/health#show", as: :rails_health_check

    # Render dynamic PWA files from app/views/pwa/*
    get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
    get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

    # Root path
    root "home#index"

    # Welcome page log in or sign up
    get "home/index" => "home#index"

    namespace :admin do
      get "dashboard/index" => "dashboard#index"
      resources :plans
      resources :exercises do
        member do
          # remove_image_exercise_path(image)
          delete "remove_image"
        end
      end
    end

    namespace :client do
      get "dashboard/index" => "dashboard#index"
    end
  end
end
