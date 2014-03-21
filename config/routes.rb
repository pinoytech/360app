Hackathon2014::Application.routes.draw do

  devise_for :users, :controllers => {
    :omniauth_callbacks => "omniauth_callbacks" 
  }

  resources :users do
    member do
      post :save_exam
      get  :assign_exam
    end
    collection do
      get :admins
    end
  end

  root to: 'home#index'

  resources :questions
  resources :categories
  resources :exams do
    collection do
      get :category_questions
      get :select_questions
      get :remove_questions
      get :question_list 
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
  resources :reports
  match 'dashboard' => 'home#dashboard', via: :get
  match '/admin/dashboard' => 'admin#index', via: :get
end
