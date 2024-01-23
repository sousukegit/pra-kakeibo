Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  #メイン機能
  get "/books",to:"books#index"
  get "/books/new",to:"books#new",as:"new"
  post "/books",to:"books#create"
  get "/books/:id",to:"books#show", as:"book"
  get "/books/:id/edit",to:"books#edit",as:"edit"

  delete "/books/:id", to:"books#destroy" ,as:"delete"
  patch "/books/:id", to:"books#update" ,as:"update"

  # resources :books

#user登録
  get "/signup" ,to:"users#new"
  post "/signup",to:"users#create"
#user認証
  get "/signin" ,to:"session#new"
  post "/signin" ,to:"session#create"
  get "/signout" ,to:"session#destroy"

end
