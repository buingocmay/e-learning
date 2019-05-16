Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, controllers: {sessions: "sessions", registrations: "registrations"}
  devise_for :admins, path: 'admin', skip: :registrations, controllers: {sessions: "admin/sessions"}
  namespace :admin do
  	resources :categories do
  		resources :units
  	end
    resources :courses
    resources :chapters do
      resources :lessons
      resources :questions
    end
  	root "static_pages#home"
  end

  resources :units
  resources :user_courses
  root "static_pages#home"
end
