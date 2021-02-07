Rails.application.routes.draw do


  get 'collected_coin/index'
  get 'collected_coin/new'
  post 'collected_coin/create'
  put 'collected_coin/update'
  delete 'collected_coin/destroy'

  get 'death/index'
  get 'death/new'
  post 'death/create'
  put 'death/update'
  delete 'death/destroy'
  
  get 'killed_monster/index'
  get 'killed_monster/new'
  post 'killed_monster/create'
  put 'killed_monster/update'
  delete 'killed_monster/destroy'
  
  get 'monster/index'
  get 'monster/new'
  post 'monster/create'
  put 'monster/update'
  delete 'monster/destroy'
  
  get 'trophy/index'
  get 'trophy/new'
  post 'trophy/create'
  put 'trophy/update'
  delete 'trophy/destroy'
  
  get 'users_trophy/index'
  get 'users_trophy/new'
  post 'users_trophy/create'
  put 'users_trophy/update'
  delete 'users_trophy/destroy'
  
  get 'user/index'
  get 'user/new'
  post 'user/create'
  put 'user/update'
  delete 'user/destroy'

  # post '/user/sign_in'
  # post '/user/sign_out'
  # post '/user/sign_up'


  resources :user do
    get 'sum_coins' #, on: :collection
  end

  resources :death do
    get 'sum_deaths'
  end

  resources :killed_monster do
    get 'sum_monsters'
  end

  resources :trophy do
    get 'rank'
  end

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  }, controllers: {
    sessions: 'sessions',
    registrations: 'registrations'
  }

  resources :protected
  

end
