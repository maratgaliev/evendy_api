Rails.application.routes.draw do

  devise_for :users, skip: [:registrations, :sessions]
  
  resources :categories
  resources :news_items
  resources :events do
    member do
      post :apply
    end
  end

  as :user do
    post '/users/sign_up', to: 'auth/registrations#create'
    post '/users/sign_in', to: 'auth/sessions#create'
    delete '/users/sign_out', to: 'auth/sessions#destroy'
  end

end
