Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :items, only: [:index, :show, :create, :destroy] do
        resource :merchant, module: 'items', only: [:show]
      end
      resources :merchants, only: [:index, :show] do
        resources :items, module: 'merchants', only: [:index]
      end
    end
  end
end

# namespace :api do
#   namespace :v1 do
#     namespace :merchants do
#       resource :find, controller: :search_merchant, only: :show
#     end
#     scope module: :merchants do
#       resources :merchants, controller: :resources do
#         resources :items, controller: :merchant_items, only: :index
#       end
#     end
#   end
# end
