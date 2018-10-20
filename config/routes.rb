Rails.application.routes.draw do
  get 'dashboard', to: 'professor_dashboard#index'
  resources :courses
  devise_for :users
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end
  root to: 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
