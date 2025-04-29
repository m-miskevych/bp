Rails.application.routes.draw do
  scope "(:locale)", locale: /en|sk/ do
    devise_for :users
    # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
    # Can be used by load balancers and uptime monitors to verify that the app is live.
    get "up" => "rails/health#show", as: :rails_health_check

    # Render dynamic PWA files from app/views/pwa/*
    get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
    get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

    # Root path
    root to: "application#index"

    namespace :admin do
      get "dashboard/index" => "dashboard#index"
      resources :users
      resources :plans do
        member do
          get "assign"
          post "assign_plan_to_client"
          delete "remove_plan_from_client"
        end
      end

      resources :user_plans, only: [ :show ] do
        collection do
          get ":user_id/:plan_id", to: "user_plans#show", as: "user_plan"
        end
      end

      resources :exercises do
        member do
          delete "remove_image" # remove_image_exercise_path(image)
        end
      end

      resources :session_slots, only: [ :index, :new, :create ]
      resources :appointments, only: [ :index, :update ]
    end

    namespace :client do
      get "dashboard/index" => "dashboard#index"
      resources :user_plans, only: [ :index, :show ] do
        member do
          patch :start
          patch :complete
        end
      end

      resources :session_slots, only: [ :index ]
      resources :appointments, only: [ :index, :new, :create, :destroy ]
    end

    # /user_plans/1/comments/4
    resources :user_plans do
      resources :comments
    end
  end
end
