class SearchesController < ApplicationController
  
  before_action :authenticate_user!

  def search
    @groups = Group.looks(params[:range],params[:video_type],params[:word])
    @word = params[:word]
    @range = params[:range]
    @video_type = params[:video_type]
  end
  
end
