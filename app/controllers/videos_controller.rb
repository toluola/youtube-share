class VideosController < ApplicationController
    skip_before_action :authorize_user, only: :index
    include Response
    include ExceptionHandler

    def create 
        @share_video = current_user.videos.create!(permit_params)
        json_response(@share_video, "Video shared successfully", :created)
    end

    def index
        @video_res = []
        @videos = Video.includes(:user)
        @videos.each do |data| 
            @video_res << {
                id: data.id,
                youtubeId: data.link,
                owner: data.user.username
            }
        end
        json_response(@video_res, "Videos Fetched Successfully") 
    end

    private

    def get_youtube_id(url)
        id = ''
        url = url.gsub(/(>|<)/i, "").split(/(vi\/|v=|\/v\/|youtu\.be\/|\/embed\/)/)
        if url[2] != nil
          id = url[2].split(/[^0-9a-z_\-]/i)
          id = id[0];
        else
          id = url;
        end
        {"link" => id }
      end

    def permit_params
        @params = params.permit(:link)
        get_youtube_id(@params[:link])
    end
end
