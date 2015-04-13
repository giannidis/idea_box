Rails.application.routes.draw do
  devise_for :users
  resources :ideas
  resources :users
  get 'tags/:tag', to: 'ideas#index', as: :tag
  root "ideas#index"
end
