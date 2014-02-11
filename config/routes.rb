Articlesale::Application.routes.draw do
resources :posts
match "posts/:id/edit_post_status", :to => 'posts#edit_post_status'

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

match "newpost/createpost", :to => 'posts#createpost'

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

# Вопросы пользователей
match "/admins/new_question", :to => 'admins#new_question'
match "/devise/admins/new_question", :to => 'admins#new_question'

# Личный кабинет администратора
get "/admins/statistics.html" => "admins#statistics"
get "/admins/news.html", to: "admins#news"
get "/admins/questions.html", to: "admins#questions"

  scope 'robokassa' do
    match 'paid'    => 'robokassa#paid',    :as => :robokassa_paid # to handle Robokassa push request

    match 'success' => 'robokassa#success', :as => :robokassa_success # to handle Robokassa success redirect
    match 'fail'    => 'robokassa#fail',    :as => :robokassa_fail # to handle Robokassa fail redirect
  end

# Личный кабинет заказчиков
get "/clients/projects.html" => "clients#projects"
match "clients/projects", to: 'clients#new_project'
get "/clients/articles.html" => "projects#articles"
get "/clients/pay.html" => "payments#index"
get "/clients/check.html" => "clients#check"
get "/clients/wait.html" => "clients#wait"
get "/clients/correct.html" => "clients#correct"
get "/clients/work.html" => "clients#work"
get "/clients/complite.html" => "clients#complite"

# Личный кабинет копирайтеров
get "/copyrighters/complite.html" => "copyrighters#complite"
get "/copyrighters/correct.html" => "copyrighters#correct"
get "/copyrighters/newpost.html" => "copyrighters#newpost"
get "/copyrighters/push.html" => "copyrighters#push"
get "/copyrighters/wait.html" => "copyrighters#wait"
get "/copyrighters/work.html" => "copyrighters#work"
get "/copyrighters/articles.html" => "projects#articles"

#Статические страницы для гостей
match "/about.html", to: 'static_pages#about'
match "/articles.html", to: 'articles#index'
match "/help.html", to: 'static_pages#help'
match "/services/copyrighters.html", to: 'static_pages#copyrighters'
match "/services/clients.html", to: 'static_pages#clients'

# Личный кабинет администратора
get "/admins/index"
 
root :to => 'static_pages#index'
end