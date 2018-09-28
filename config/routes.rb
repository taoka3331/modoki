Rails.application.routes.draw do

  namespace :admins do
    get 'users/new'
  end
  namespace :admins do
    get 'admins/new'
  end
  devise_for :admins
  get 'relationships/index'
  get 'relationships/show'
  get 'relationships/new'
  get 'relationships/edit'
  get 'users/show'

namespace :admin, path: 'admin' do
  root 'user#index', as: :root
  resources :admins, :only => [:index, :show, :destroy, :edit, :create, :update]
  get 'admins/top' =>'admins#top'
end

	devise_for :users
	root to: 'posts#top'
  resources :users, :only => [:index, :show, :destroy, :edit, :create, :update] do
    member do
     get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
	resources :notifications
	get 'notifications/:id/link_through', to: 'notifications#link_through',
 	as: :link_through
  get 'notifications', to: 'notifications#index'
  resources :follow_notifications
  get 'follow_notifications/:id/link_through', to: 'follow_notifications#link_through',
  as: :follow_link_through
    resources :articles
    resources :posts do
 		  resource :likes, only: [:create,:destroy]
      resources :comments,except: [:index,:show] do
        member do
            get :reply
        end
      end
  end

 	get '/top' =>'posts#top'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
