Rails.application.routes.draw do

get "upload" => "images#new", :as => "upload"


  devise_for :users

  root 'posts#index'

  resources :posts, only: [:show, :index]
  resources :tags, only: [:show]
  resources :categories, only: [:show]
  resources :caps, only: [:show, :index]
  resources :contacts, only: [:show, :index]
  resources :images, only: [:index]


  namespace :admin do
    resources :posts, except: [:show, :index]
    resources :categories, except: [:show]
    resources :pictures, only: [:create, :destroy]
    resources :caps, except: [:show, :index]
    resources :contacts, except: [:show, :index]
    resources :images,  except: [:index]
    resources :panels, except: [:show, :index]
  end
end
