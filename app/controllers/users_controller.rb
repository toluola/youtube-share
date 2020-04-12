class UserController < ApplicationController
    skip_before_action :authorize_user, only: :create
    include Response
    include ExceptionHandler
  
    def create
      create_user = User.create!(username: accept_params[:username],
                                      password: accept_params[:password])
      json_response(create_user.slice(:id, :name, :username, :created_at, :updated_at),
                    "User created successfully",
                    :created)
    end
  
    private
  
    def accept_params
      params.permit(:username, :password)
    end
  end
