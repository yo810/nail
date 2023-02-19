Rails.application.routes.draw do

  #顧客用
  devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  scope module: :public do
    root 'homes#top'
    get 'customers/my_page' => 'customers#show', as: 'my_page'
    # customers/editのようにするとdeviseのルーティングとかぶってしまうためinformationを付け加えている。
    get 'customers/information/edit' => 'customers#edit', as: 'edit_information'
    patch 'customers/information' => 'customers#update', as: 'update_information'
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'confirm_unsubscribe'
    patch 'customers/widhdraw' => 'customers#widhdraw', as: 'widhdraw_customer'

    resources :menus, only: [:index, :show] do
      resources :reservations, only: [:new, :create, :destroy]
      get '/reservations/confirm' => 'reservations#confirm', as: 'confirm'
    end
    resources :photos, only: [:index, :show] do
      resource :favorites, only: [:create, :destroy]
    end

  end

  #管理者用
  devise_for :admin, controllers: {
  sessions: "admin/sessions"
  }

  namespace :admin do
    get 'top' => 'homes#top', as: 'top'
    resources :reservations, only: [:index, :show, :update]
    # resources :menus, except: [:destroy] do
    resources :menus, only: [:new, :index, :show, :edit, :update, :destroy, :create] do
      resources :reservations, only: [:index, :show, :update]
    end
    # resources :photos, except: [:destroy]
    resources :photos, only: [:new, :index, :show, :edit, :update, :destroy, :create]
    resources :customers, only: [:index, :show, :edit, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
