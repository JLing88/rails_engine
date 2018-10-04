Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :customers do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
      end
      resources :customers, only: [:index, :show]

      namespace :merchants do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
      end
      resources :merchants, only: [:index, :show]

      namespace :items do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
      end
      resources :items, only: [:index, :show]
      
      resources :invoices, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :transactions, only: [:index, :show]
    end
  end
end
