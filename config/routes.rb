Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'static_pages#home'
  devise_for :users
  get  'item_pictures/gallery'
  get  'item_videos/gallery'
  resources :item_videos
  resources :item_pictures


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
