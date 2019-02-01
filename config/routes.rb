Rails.application.routes.draw do
  get 'articles/index'

 root 'welcome#home'
  get 'about', to: 'welcome#about'

  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
