DsgnrsIn::Application.routes.draw do
  resources :users
  # will give routes for users:
  # index, new, create, show, edit, update, destroy

  get "sessions/create"
  get "sessions/destroy"

  match "/sitemap", :to => 'sitemap#index', :as => :sitemap

  match "/auth/twitter/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout
  match '/auth/failure' => "sessions#failure"

  get "/apply" => "users#edit", :as => :apply
  get "/profile" => "users#edit", :as => :profile
  get "/manage/(:status)", :to => 'users#index', :as => :filter

  match "/:city", :to => 'users#index', :as => :city
  root :to => 'users#index'
end
