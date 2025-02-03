Rails.application.routes.draw do
  scope "(:locale)", locale: /en|sk/ do
    get "dashboard/index"
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
    # Can be used by load balancers and uptime monitors to verify that the app is live.
    get "up" => "rails/health#show", as: :rails_health_check

    # Render dynamic PWA files from app/views/pwa/*
    get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
    get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

    # Defines the root path route ("/")
    root "dashboard#index"

    resources :exercises do
      member do
        # remove_image_exercise_path(image)
        delete "remove_image"
      end
    end

    resources :plans
  end
end
