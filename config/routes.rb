Rails.application.routes.draw do
  post "auth/login" => "authentication#authenticate"
  post "auth/signup" => "users#create"
  post "share" => "videos#create"
  get "share" => "videos#index"
end
