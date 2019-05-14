Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: "sessions"}
  devise_for :admins, path: 'admin', skip: :registrations, controllers: {sessions: "admin/sessions"}
  namespace :admin do
  	resources :categories do
  		resources :units
  	end
    resources :courses
    resources :chapters

  	root "static_pages#home"
  end

  root "static_pages#home"
end
