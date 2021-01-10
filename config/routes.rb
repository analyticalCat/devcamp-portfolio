Rails.application.routes.draw do
  devise_for :users
  resources :portfolios, except: [:show]
  # this will change the route for localhost:3000/angular
  get 'angular', to: 'portfolios#angular'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  get 'about', to: 'pages#about'
  # we can do get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'


  resources :blogs do
    member do
      get :toggle_status
    end
  end
  root to: 'pages#home'
  # For detaßils on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
