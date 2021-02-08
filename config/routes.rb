Rails.application.routes.draw do

  # mount Rswag::Ui::Engine => '/api-docs'
  # mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :collected_coin
  resources :death
  resources :killed_monster
  resources :monster, only: [:index, :update]
  resources :trophy

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
