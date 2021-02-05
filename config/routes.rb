Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

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
  # get 'monster/new'
  post 'monster/create'
  put 'monster/update'
  # get 'monster/destroy'
  get 'trophy/index'
  # get 'trophy/new'
  # get 'trophy/create'
  # get 'trophy/update'
  # get 'trophy/destroy'
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

  post 'auth/auth'



  resources :user do
    # resources :teste
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

  # resources :auth do
  #   post 'auth'
  # end
  

end
