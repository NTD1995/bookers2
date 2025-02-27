Rails.application.routes.draw do
  # get 'users/edit'
   # get 'users/update'
  # get 'users/index'
  # get 'users/show'
    # get 'users/:id/edit' => 'users#edit', as: 'edit_user'
      devise_for :users
  resources :users, only: [:edit, :update,:index, :show]
  # get 'books/new'
  # get 'books/index'
  # get 'books/show'
  # get 'books/edit'
   # delete 'books/:id' => 'books#destroy', as: 'destroy_book'
    resources :books, only: [:new, :index, :show, :edit, :create, :destroy, :update]

 root to: "homes#top"
 get'/home/about' => 'homes#about' ,as: 'about'
end