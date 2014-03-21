Hackathon2014::Application.routes.draw do
  devise_for :users
  root to: 'home#dashboard'
end
