Rails.application.routes.draw do

  root "chefs#index"
  resources :chefs do
    resources :cookbooks do
      resources :recipes
    end
  end

  get 'sessions/new' => 'sessions#new', as: 'log_in'
  post 'sessions' => 'sessions#create'
  delete 'sessions' => 'sessions#destroy', as: 'log_out'


  get 'profiles' => 'profiles#index'

  get 'list' => 'yes#index' # Is this intentional?
  get 'yes_sms' => 'yes#index' # Is this intentional?
  get 'yes_sms/pipe' => 'yes#pipe'
  get 'yes_sms/send' => 'yes#sms'

end
