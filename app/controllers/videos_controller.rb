class VideosController < ApplicationController
    include Response
    include ExceptionHandler

    def create
        @share_video = current_user.videos.create!(permit_params)
        json_response(@share_video, "Video shared successfully", :created)
    end

    private

    def permit_params
        params.permit(:link)
    end
end
