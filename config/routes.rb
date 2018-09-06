Rails.application.routes.draw do
  root to: 'welcome#index'
  devise_for :professors
  devise_for :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
