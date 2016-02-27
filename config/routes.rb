Rails.application.routes.draw do
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: [:index, :show]

  resources :drinks, except: [:new, :edit, :create]
  resources :stores, except: [:new, :edit] do
    resources :drinks, only: [:create]
  end
end
