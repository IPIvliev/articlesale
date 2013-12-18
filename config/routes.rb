Articlesale::Application.routes.draw do
  get "static_pages/index"

  get "static_pages/about"

  get "static_pages/help"

  get "static_pages/services"

  get "static_pages/articles"
 
  root :to => 'static_pages#index'

end
