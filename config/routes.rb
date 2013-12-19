Articlesale::Application.routes.draw do
  get "copyrighters/home"

  get "clients/home"

  get "users/signup_client"

  get "users/signup_copy"

get "index.html" => "static_pages#index"

match "/about.html", to: 'static_pages#about'
match "/articles.html", to: 'static_pages#articles'
match "/help.html", to: 'static_pages#help'
match "/services/copyrighters.html", to: 'static_pages#copyrighters'
match "/services/clients.html", to: 'static_pages#clients'
 
root :to => 'static_pages#index'
end
