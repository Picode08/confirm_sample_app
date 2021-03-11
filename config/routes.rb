Rails.application.routes.draw do
  resources :everychecks do
    get :confirm, on: :collection   #=>本来getはまずいですが買い物かごできるまでgetにします。
  end
  resources :users
  root 'everychecks#confirm'
end
