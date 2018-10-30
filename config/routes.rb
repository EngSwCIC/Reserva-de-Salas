Rails.application.routes.draw do
  
  root 'home#index'

  devise_for :users, skip: [:registrations, :sessions], :controllers => { :registrations => "users/registrations" }

  devise_scope :user do
    get 'login', to: 'users/sessions#new', as: :"new_user_session"
    post 'login', to: 'users/sessions#create', as: :"user_session"
    delete 'logout', to: 'users/sessions#destroy', as: :"destroy_user_session"
    get 'create_user', to: 'users/registrations#new', as: :"new_user_registration"
    post 'create_user', to: 'users/registrations#create', as: :"user_registration"
    delete '', to: 'users/registrations#destroy', as: :""
    patch 'users/:id', to: 'users/registrations#update', as: :"update_user_registration" 
    put 'users/:id', to: 'users/registrations#update', as: :"" 
    get 'users/:id/edit', to: 'users/registrations#edit', as: :"edit_user_registration"

  end

  resources :rooms
  get 'free-rooms', to: 'rooms#free_rooms'
  #get 'free-rooms-result', to: 'rooms#free_rooms_result'
  resources :appointments
  get 'my-appointments' => 'appointments#my_appointments'
  get 'all-appointments' => 'appointments#all_appointments'
  get 'backoffice', to: 'backoffice/dashboard#index'
  get 'signup_admin', to: 'backoffice/dashboard#signup_admin'
  post '', to: 'backoffice/dashboard#create', as: :"admin_registration"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
