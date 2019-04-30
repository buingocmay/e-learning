Rails.application.routes.draw do
  devise_for :admins, path: 'admin', skip: :registrations
  namespace :admin do
  	
  end
  root "static_pages#home"
end
