Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :candidates
      resources :votes
      resources :voters
    end
  end
end
