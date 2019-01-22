Rails.application.routes.draw do
  root 'homes#top'
  get '/home/about', to: 'homes#about',as: 'about'
  devise_for :users, :controllers => {
  	:registrations => 'users/registrations',
  	:sessions => 'users/sessions'
  }

  resources :books
  resources :users
  resources :post_images, only:[:new, :create, :index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end