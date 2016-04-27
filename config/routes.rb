Rails.application.routes.draw do
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users

  resources :drinks, except: [:new, :edit, :create] do
    resources :comments, only: [:create]
  end

  resources :stores, only: [:index, :show] do
    resources :drinks, only: [:create]
  end

  resources :comments, except: [:create]
end
