Rails.application.routes.draw do
  # get 'users/edit'
   # get 'users/update'
  # get 'users/index'
  # get 'users/show'
    # get 'users/:id/edit' => 'users#edit', as: 'edit_user'
  resources :users, only: [:edit, :update,:index, :show]
  # get 'books/new'
  # get 'books/index'
  # get 'books/show'
  # get 'books/edit'
    resources :books, only: [:new, :index, :show, :edit, :create]
  devise_for :users
 root to: "homes#top"
 get'/homes/about' => 'homes#about' ,as: 'about'
   patch 'users/:id' => 'users#update', as: 'update_user'
end