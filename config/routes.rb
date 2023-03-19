Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    # Version 1
    namespace :v1 do
      resources :timecards, only: :index do
        collection do
          post :time_in
          post :time_out
        end
      end

      resources :users, only: :create do
        collection do
          post :follow
          post :unfollow
        end
      end
    end
  end
end
