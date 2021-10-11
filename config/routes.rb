Rails.application.routes.draw do
  devise_for :admin, controllers: {
  sessions:      'admin/sessions',
  passwords:     'admin/passwords',
  registrations: 'admin/registrations'
  }
  devise_for :customers, controllers: {
  sessions:      'public/sessions',
  passwords:     'public/passwords',
  registrations: 'public/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    root :to => 'homes#top'
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :customers, only: [:show, :edit, :update]
    resources :posts, only: [:index, :show, :destroy] do
      resources :comments, only: [:destroy]
    end
  end

  root to: 'homes#top'
  get "about" => "homes#about"
  scope module: :public do
    resources :customers, only: [:show, :update, :edit] do
      resource :relationships, only: [:create, :destroy]
        get 'followings' => 'relationships#followings', as: 'followings'
        get 'followers' => 'relationships#followers', as: 'followers'
      member do
        get 'unsubscribe'
        patch 'withdraw'
        get 'good'
      end
    end
    resources :posts do
      resources :comments, only: [:create, :destroy]
      resources :goods, only: [:create, :destroy]
    end
  end
end
