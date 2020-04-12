Rails.application.routes.draw do
  post "auth/login" => "authentication#authenticate"
  post "auth/signup" => "user#create"
end
