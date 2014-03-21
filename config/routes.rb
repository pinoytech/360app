Hackathon2014::Application.routes.draw do
  devise_for :users
  resources :users
  root to: 'home#index'

  resources :questions
  resources :categories
  resources :exams do
    collection do
      get :category_questions
    end
  end
  resources :seasons
  resources :messages do
    collection do
      get :search_users
    end
  end

  resources :feedbacks
  resources :badges
  match 'dashboard' => 'home#dashboard', via: :get
  match '/admin/dashboard' => 'admin#index', via: :get
end
