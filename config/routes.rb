Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :customers do
        get '/find', to: 'customers_find#show'
        get '/find_all', to: 'customers_find#index'
        get '/random', to: 'customers_random#show'
      end
      resources :customers, only: [:index, :show] do
        get '/transactions', to: 'customers/transactions#index'
        get '/invoices', to: 'customers/invoices#index'
        get '/favorite_merchant', to: 'customers/favorite_merchant#show'
      end

      namespace :merchants do
        get '/find',         to: 'merchants_find#show'
        get '/find_all',     to: 'merchants_find#index'
        get '/random',       to: 'merchants_random#show'
        get '/most_revenue', to: 'merchants_top_revenue#index'
        get '/most_items',   to: 'merchants_most_items#index'
        get '/revenue',      to: 'merchants_revenue#show'
      end
      resources :merchants, only: [:index, :show] do
        get '/items', to: 'merchants/items#index'
        get '/invoices', to: 'merchants/invoices#show'
      end

      namespace :items do
        get '/find', to: 'items_find#show'
        get '/find_all', to: 'items_find#index'
        get 'random', to: 'items_random#show'
      end
      resources :items, only: [:index, :show] do
        get '/invoice_items', to: 'items/invoice_items#show'
        get '/merchant', to: 'items/merchant#show'
      end

      namespace :invoices do
        get '/find', to: 'invoices_find#show'
        get '/find_all', to: 'invoices_find#index'
        get '/random', to: 'invoices_random#show'
      end
      resources :invoices, only: [:index, :show] do
        get '/transactions', to: 'invoices/transactions#show'
        get 'invoice_items', to: 'invoices/invoice_items#show'
        get '/items', to: 'invoices/items#show'
        get '/customer', to: 'invoices/customer#show'
        get '/merchant', to: 'invoices/merchant#show'
      end

      namespace :invoice_items do
        get '/find', to: 'invoice_items_find#show'
        get '/find_all', to: 'invoice_items_find#index'
        get '/random', to: 'invoice_items_random#show'
      end
      resources :invoice_items, only: [:index, :show] do
        get 'invoice', to: 'invoice_items/invoice#show'
        get 'item', to: 'invoice_items/item#show'
      end

      namespace :transactions do
        get '/find', to: 'transactions_find#show'
        get '/find_all', to: 'transactions_find#index'
        get '/random', to: 'transactions_random#show'
      end
      resources :transactions, only: [:index, :show] do
        get '/invoice', to: 'transactions/invoice#show'
      end
    end
  end
end
