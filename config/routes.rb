Rails.application.routes.draw do

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}
  root "contents#top"
  get "/about" => "contents#about"
  get "contents/search_result" => "contents#search_result", as:"search"
  get "/favorite_contents" => "users#favorite_contents"
  get "/show_following" => "users#show_following"
  get "/show_follower" => "users#show_follower"
  get "/time_line" => "contents#time_line"
  get "/payment_request" => "users#payment_request"
  get "/payments" => "admins#payments"
  get "/formove_index" => "users#formove_index"
  post "/users/balance" => "payments#balance_save", as: "balance_save"
  post "/nagesen" => "payments#nagesen"

  resources :users
  resources :admins
  resources :balances
  resources :relationships
  resources :comments
  resources :contents
  resources :favorite_contents, only: [:create, :destroy]
  resources :payments, only: [:create, :destroy]

  resources :users do
    member do
     get :following, :followers
    end
  end

   resources :contents do
    member do
      post "add", to: "favorite_contents#create"
    end
  end

end
