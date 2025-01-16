Rails.application.routes.draw do
  get 'users/edit'
  get 'users/index'
  resources :users
  get 'books/new'
  get 'books/index'
  get 'books/show'
  get 'books/edit'
  devise_for :users
 root to: "homes#top"
 get'/homes/about' => 'homes#about' ,as: 'about'
  get 'users/:id/edit' => 'users#edit', as: 'edit_user'
   patch 'users/:id' => 'users#update', as: 'update_user'
end