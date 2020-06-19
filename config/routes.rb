Rails.application.routes.draw do

  get 'comments/index'
  # get 'carts/new'
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # get 'home/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "shops#index"

  # resources :items do
  #   collection do
  #     post :confirm
  #   end
  # end

  # resources :shops do
  #   collection do
  #     post :confirm
  #   end
  # end

  resources :shops do
    collection do
      post :confirm
    end
    resources :items do
      collection do
        post :confirm
      end
    end
  end

  resources :carts

  # resources :carts, only: [:show]
  # post '/add_item' => 'carts#add_item'
  # post '/update_item' => 'carts#update_item'
  # delete '/delete_item' => 'carts#delete_item'

  resources :cart_items

  resources :orders

  get 'search' => 'shops#search'

  # get '/map_request', to: 'shops#map', as: 'map_request'

  
  devise_for :shop_owners, path: 'shop_owners', controllers: {
    sessions: 'shop_owners/sessions',
    passwords: 'shop_owners/passwords',
    registrations: 'shop_owners/registrations'
    # shop_owners: 'shop_owners/index'
    # index: 'shop_owners/index'
  }
  resources :shop_owners, only: [:index, :show, :edit]

  devise_for :users, path: 'users', controllers: {
    registrations: 'users/registrations', 
    sessions: 'users/sessions'
  }


  # devise_for :admins, path: 'admins', controllers: {
  #   sessions: 'admins/sessions'
  # }

  # devise_scope :user do
  #   get "sign_in", :to => "users/sessions#new"
  #   get "sign_out", :to => "users/sessions#destroy" 
  # end

  # devise_scope :shop_owner do
  #   get "sign_in", :to => "shop_owners/sessions#new"
  #   get "sign_out", :to => "shop_owners/sessions#destroy" 
  # end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  

end
