class UsersController < ApplicationController
    skip_before_action :authorize_user, only: :create
    include Response
    include ExceptionHandler
  
    def create
      create_user = User.create!(username: accept_params[:username],
                                      password: accept_params[:password])
      create_token = JsonWebToken.encode(user_id: create_user.id)
      json_response({ token: create_token }, "User created successfully", :created)
    end
  
    private
  
    def accept_params
      params.permit(:username, :password)
    end
  end
