# frozen_string_literal: true

Rails.application.routes.draw do

  root 'main#home'
  #======================== ASK ================================
  # get 'home/index'
  get 'asks/recibidas'
  get 'asks/creadas'
  get 'asks/edit'
  patch 'asks/update', to: 'asks#update', as: 'asks_update'
  get 'asks/show'
  #  get 'asks/new'
  #  post 'asks', to: 'asks#create'
  get 'asks/delete', to: 'asks#delete', as: 'asks_delete'
  resources :asks do
    member do
      post 'aceptado'
      delete 'rechazado'
    end
  end
  #======================= CARS/ASK, CARS/REVIEWS ===================
  resources :cars do
    resources :reviews, only: [:new, :create]
    resources :asks, only: [:new, :create]
  end
  #====================== MENSAJE ====================================
  resources :conversaciones do
    resources :mensajes
  end
  #===================== USER ========================================
  devise_for :user, controllers: {
    registrations: 'users/registrations'
    }
  
  #====================== COMENTARIO ======================================
  resources :comentarios

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
    end
  end
