Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'collected_coin/index'
  get 'collected_coin/new'
  get 'collected_coin/create'
  get 'collected_coin/update'
  get 'collected_coin/destroy'
  get 'death/index'
  get 'death/new'
  get 'death/create'
  get 'death/update'
  get 'death/destroy'
  get 'killed_monster/index'
  get 'killed_monster/new'
  get 'killed_monster/create'
  get 'killed_monster/update'
  get 'killed_monster/destroy'
  get 'monster/index'
  # get 'monster/new'
  # get 'monster/create'
  get 'monster/update'
  # get 'monster/destroy'
  get 'trophy/index'
  # get 'trophy/new'
  # get 'trophy/create'
  # get 'trophy/update'
  # get 'trophy/destroy'
  get 'users_trophy/index'
  get 'users_trophy/new'
  get 'users_trophy/create'
  get 'users_trophy/update'
  get 'users_trophy/destroy'
  get 'user/index'
  get 'user/new'
  get 'user/create'
  get 'user/update'
  get 'user/destroy'

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
