Rails.application.routes.draw do
  # get 'users/edit'
  # get 'users/index'
  # get 'users/show'
  resources :users, only[:edit, :index, :show]
  # get 'books/new'
  # get 'books/index'
  # get 'books/show'
  # get 'books/edit'
    resources :books, only: [:new, :index, :show, :edit]
  devise_for :users
 root to: "homes#top"
 get'/homes/about' => 'homes#about' ,as: 'about'
  get 'users/:id/edit' => 'users#edit', as: 'edit_user'
   patch 'users/:id' => 'users#update', as: 'update_user'
end