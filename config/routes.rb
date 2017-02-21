Rails.application.routes.draw do
  resources :portfolios, except: [:show]
  get 'portfolio/:id' => 'portfolios#show', as: 'portfolio_show'
  
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'

  resources :blogs
  
  root 'pages#home'
end
