Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :customers do
        get '/find', to: 'customers_find#show'
        get '/find_all', to: 'customers_find#index'
      end
      resources :customers, only: [:index, :show] do
        get '/transactions', to: 'customers/transactions#index'
        get '/invoices', to: 'customers/invoices#index'
      end

      namespace :merchants do
        get '/find', to: 'merchants_find#show'
        get '/find_all', to: 'merchants_find#index'
        get '/random', to: 'merchants_random#show'
      end
      resources :merchants, only: [:index, :show] do
        get '/items', to: 'merchants/items#index'
      end

      namespace :items do
        get '/find', to: 'items_find#show'
        get '/find_all', to: 'items_find#index'
        get 'random', to: 'items_random#show'
      end
      resources :items, only: [:index, :show]

      namespace :invoices do
        get '/find', to: 'invoices_find#show'
        get '/find_all', to: 'invoices_find#index'
      end
      resources :invoices, only: [:index, :show]

      namespace :invoice_items do
        get '/find', to: 'invoice_items_find#show'
        get '/find_all', to: 'invoice_items_find#index'
      end
      resources :invoice_items, only: [:index, :show]

      namespace :transactions do
        get '/find', to: 'transactions_find#show'
        get '/find_all', to: 'transactions_find#index'
        get '/random', to: 'transactions_random#show'
      end
      resources :transactions, only: [:index, :show]
    end
  end
end
