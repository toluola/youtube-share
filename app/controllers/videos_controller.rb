class VideosController < ApplicationController
    skip_before_action :authorize_user, only: :index
    include Response
    include ExceptionHandler

    def create
        @share_video = current_user.videos.create!(permit_params)
        json_response(@share_video, "Video shared successfully", :created)
    end

    def index
        @videos = Video.all
        json_response(@videos, "Videos Fetched Successfully") 
    end
    private

    def permit_params
        params.permit(:link)
    end
end
