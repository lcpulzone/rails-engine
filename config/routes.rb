Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :items, only: [:index, :show, :create, :update, :destroy] do
        resource :merchant, module: 'items', only: [:show]
      end
      get '/merchants/find', to: 'merchants#search'
      resources :merchants, only: [:index, :show] do
        resources :items, module: 'merchants', only: [:index]
      end
      namespace :revenue do
        resources :merchants, only: [:index]
        resources :items, only: [:index]
      end
    end
  end
  # namespace :api do
  #   namespace :v1 do
  #     namespace :merchants do
  #       resource :find, controller: :search_merchant, only: :show
  #     end
  #   end
  # end
end
