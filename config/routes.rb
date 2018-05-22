Rails.application.routes.draw do
  
  root 'home#index'

  devise_for :users

  devise_scope :user do
    get 'login', to: 'users/sessions#new', as: :login
    post 'login', to: 'users/sessions#create', as: :""
    post 'logout', to: 'users/sessions#destroy', as: :"logout"
    get 'create_user', to: 'users/registrations#new', as: :"create_user"
    post 'create_user', to: 'users/registrations#create', as: :""
  end

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
