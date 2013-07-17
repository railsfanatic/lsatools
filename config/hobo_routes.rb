# This is an auto-generated file: don't edit!
# You can add your own routes in the config/routes.rb file
# which will override the routes in this file.

Lsatools::Application.routes.draw do


  # Resource routes for controller agenda_items
  resources :agenda_items, :only => [:new, :edit, :show, :create, :update, :destroy] do
    collection do
      post 'reorder'
    end
  end

  # Owner routes for controller agenda_items
  resources :meetings, :as => :meeting, :only => [] do
    resources :agenda_items, :only => [] do
      collection do
        post 'create', :action => 'create_for_meeting'
      end
    end
  end


  # Resource routes for controller meetings
  resources :meetings


  # Resource routes for controller projects
  resources :projects


  # Resource routes for controller tasks
  resources :tasks, :only => [:new, :edit, :show, :create, :update, :destroy] do
    collection do
      post 'reorder'
    end
  end

  # Owner routes for controller tasks
  resources :agenda_items, :as => :agenda_item, :only => [] do
    resources :tasks, :only => [] do
      collection do
        post 'create', :action => 'create_for_agenda_item'
      end
    end
  end


  # Resource routes for controller topics
  resources :topics, :only => [:index, :edit, :show, :create, :update, :destroy] do
    collection do
      post 'reorder'
    end
    member do
      post 'move_higher'
      post 'move_lower'
    end
  end


  # Resource routes for controller users
  resources :users, :only => [:edit, :show, :create, :update, :destroy] do
    member do
      get 'account'
      put 'accept_invitation', :action => 'do_accept_invitation'
      get 'accept_invitation'
      put 'reset_password', :action => 'do_reset_password'
      get 'reset_password'
    end
  end

  # User routes for controller users
  match 'login(.:format)' => 'users#login', :as => 'user_login'
  get 'logout(.:format)' => 'users#logout', :as => 'user_logout'
  match 'forgot_password(.:format)' => 'users#forgot_password', :as => 'user_forgot_password'

  namespace :admin do


    # Resource routes for controller admin/users
    resources :users do
      collection do
        post 'invite', :action => 'do_invite'
        get 'invite'
      end
    end

  end

end
