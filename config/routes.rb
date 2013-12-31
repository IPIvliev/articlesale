Articlesale::Application.routes.draw do
  resources :articles

  resources :messages

  get "omniauth_callbacks/facebook"

  get "omniauth_callbacks/vkontakte"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }


  resources :users, :only => [:index, :destroy]

get "index.html" => "static_pages#index"

get "/clients/projects.html" => "clients#projects"
get "/clients/copy.html" => "clients#copy"
get "/clients/articles.html" => "clients#articles"
get "/clients/pay.html" => "clients#pay"
get "/clients/profile.html" => "clients#profile"
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