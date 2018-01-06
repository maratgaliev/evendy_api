Rails.application.routes.draw do

  telegram_webhooks TelegramWebhooksController
  
  devise_for :users, skip: [:registrations, :sessions]
  
  resources :categories
  resources :news_items
  resources :events do
    member do
      post :apply
    end
  end

  get '/stats', to: 'stat_results#index', as: 'stats'

  as :user do
    post '/users/sign_up', to: 'auth/registrations#create'
    post '/users/sign_in', to: 'auth/sessions#create'
    delete '/users/sign_out', to: 'auth/sessions#destroy'
  end

end
