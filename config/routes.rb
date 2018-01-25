Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 

  resources :books
 # get '/top' => 'books#top'ではなく以下のように記述することでURLがhttp://localhost:3000/topではなくhttp://localhost:3000/でよくなる。
  root 'books#top'
end
