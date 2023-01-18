Rails.application.routes.draw do
  
  devise_for :users do

  end
  devise_scope :user do
    
    root to: "devise/sessions#new"
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  post '/users/:id/edit', to: 'users#update'
  resources :tags
  resources :users
  resources :campaigns do
    resources :tags
    resources :comments
    resources :todos
    resources :discussion_topics
  end
  resources :discussion_topics do
    resources :comments
  end
  # root to: "articles#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
