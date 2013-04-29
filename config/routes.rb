TomApp::Application.routes.draw do

  resources :contacts

  resources :loans

  resources :welcome, :only => :index

  root :to => "welcome#index"

end
