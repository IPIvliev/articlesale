Articlesale::Application.routes.draw do
resources :projects do
	post :create_order, :on => :member
	resources :orders, :only => [:show], :to => "projects#showorder"

match "orders/:id/edit", to: 'projects#edit_status'
match "orders/:id/delete", to: 'projects#delete'
end

  resources :articles

resources :discussions do 
  resources :messages, :on => :member
  post :newmessage, :on => :member
end

  get "omniauth_callbacks/facebook"

  get "omniauth_callbacks/vkontakte"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }


  resources :users, :only => [:index, :show, :destroy]

get "index.html" => "static_pages#index"

get "/clients/projects.html" => "clients#projects"
match "clients/projects", to: 'clients#new_project'

get "/clients/copy.html" => "clients#copy"
get "/clients/articles.html" => "clients#articles"
get "/clients/pay.html" => "clients#pay"
get "/clients/check.html" => "clients#check"
get "/clients/wait.html" => "clients#wait"
get "/clients/correct.html" => "clients#correct"
get "/clients/work.html" => "clients#work"
get "/clients/complite.html" => "clients#complite"

get "/copyrighters/profile.html" => "copyrighters#profile"

match "/about.html", to: 'static_pages#about'
match "/articles.html", to: 'articles#index'
match "/help.html", to: 'static_pages#help'
match "/services/copyrighters.html", to: 'static_pages#copyrighters'
match "/services/clients.html", to: 'static_pages#clients'


  get "/admins/index"
 
root :to => 'static_pages#index'
end