Hackathon2014::Application.routes.draw do
  devise_for :users
  resources :questions
  resources :categories
  resources :exams
  resources :messages
  root to: 'home#dashboard'
  match 'dashboard' => 'home#dashboard', via: :get

  resources :messages
  resources :badges
end
