Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :customers
      post '/customer_filter', to: 'customers#customer_filter', as: :customer_filter
    end
  end
end
