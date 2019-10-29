Rails.application.routes.draw do
  devise_for :users
  resources :blogs do
    member do
      get :toggle_status
    end
  end
  resources :portfolios, except: [:show]
  get 'react-items', to: 'portfolios#react'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  root to: 'pages#home'
end
