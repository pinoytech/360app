Hackathon2014::Application.routes.draw do
  devise_for :users
  resources :users
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
  match 'dashboard' => 'home#dashboard', via: :get
  match '/admin/dashboard' => 'admin#index', via: :get

  resources :exams_users do
    collection do
      get :responses
      post :create_response
    end
  end

end
