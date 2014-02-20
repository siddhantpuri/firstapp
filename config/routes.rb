Firstapp::Application.routes.draw do
  resource :users
  get 'users/login' => 'users#login'
  post 'users/add' => 'users#add'

  root :to => 'home#login'
end