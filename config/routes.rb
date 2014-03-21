Hackathon2014::Application.routes.draw do
  devise_for :users
  root to: 'home#dashboard'
  
  resources :questions
  resources :categories
  resources :exams
  resources :messages

  match 'dashboard' => 'home#dashboard', via: :get
  match '/admin/dashboard' => 'admin#index', via: :get
end
