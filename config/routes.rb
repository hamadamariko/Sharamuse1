Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'hello/index' => 'hello#index'
  get 'hello/link' => 'hello#link'
  resources :tweets do
    resources :comments, only: [:create]
  end
  resources :posts
  get 'posts/index' => 'posts#index'
  get 'posts/new' => 'posts#new'
  root "tweets#index"
  get 'tweets/index' => 'tweets#index'
  get 'tweets/new' => 'tweets#new'

  get 'home/index' => 'home#index'

  get "searches" => "searches#search"
  get 'searches/search_result' => 'searches#search_result'
end
