Articlesale::Application.routes.draw do
resources :projects do
	post :create_order, :on => :member

  resources :orders, :only => [:show], :to => "projects#showorder" do

  end
match "orders/:id/create_post", :to => 'projects#create_post'
match "orders/:id/edit_post", :to => 'projects#edit_post'
match "orders/:id/edit_post_status", :to => 'projects#edit_post_status'

match "orders/:id/edit", to: 'projects#edit_status'
match "orders/:id/delete", to: 'projects#delete'
end

match "wait/create_post", :to => 'projects#create_post'

  resources :articles

resources :discussions do 
  resources :messages, :on => :member
  post :newmessage, :on => :member
end

  get "omniauth_callbacks/facebook"

  get "omniauth_callbacks/vkontakte"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }


  resources :users, :only => [:index, :show, :destroy] do
    resources :posts
  end

get "index.html" => "static_pages#index"

get "/clients/projects.html" => "clients#projects"
match "clients/projects", to: 'clients#new_project'

get "/clients/articles.html" => "projects#articles"
get "/clients/pay.html" => "clients#pay"
get "/clients/check.html" => "clients#check"
get "/clients/wait.html" => "clients#wait"
get "/clients/correct.html" => "clients#correct"
get "/clients/work.html" => "clients#work"
get "/clients/complite.html" => "clients#complite"

get "/copyrighters/complite.html" => "copyrighters#complite"
get "/copyrighters/correct.html" => "copyrighters#correct"
get "/copyrighters/newpost.html" => "copyrighters#newpost"
get "/copyrighters/push.html" => "copyrighters#push"
get "/copyrighters/wait.html" => "copyrighters#wait"
get "/copyrighters/work.html" => "copyrighters#work"
get "/copyrighters/articles.html" => "projects#articles"

match "/about.html", to: 'static_pages#about'
match "/articles.html", to: 'articles#index'
match "/help.html", to: 'static_pages#help'
match "/services/copyrighters.html", to: 'static_pages#copyrighters'
match "/services/clients.html", to: 'static_pages#clients'


  get "/admins/index"
 
root :to => 'static_pages#index'
end