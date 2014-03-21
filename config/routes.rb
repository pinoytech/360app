Hackathon2014::Application.routes.draw do
  devise_for :users
  root to: 'home#dashboard'
  match 'dashboard' => 'home#dashboard', via: :get

  resources :messages
end
