Articlesale::Application.routes.draw do
  get "users/signup_client"
  get "users/signup_copy"

get "index.html" => "static_pages#index"

get "/clients/home.html" => "clients#home"
get "/clients/copy.html" => "clients#copy"
get "/clients/articles.html" => "clients#articles"
get "/clients/pay.html" => "clients#pay"

match "/about.html", to: 'static_pages#about'
match "/articles.html", to: 'static_pages#articles'
match "/help.html", to: 'static_pages#help'
match "/services/copyrighters.html", to: 'static_pages#copyrighters'
match "/services/clients.html", to: 'static_pages#clients'
 
root :to => 'static_pages#index'
end
