module Api
  class MediaController < ApplicationController
    helper GiphyAdapter

    def health
      response = GiphyAdapter.search(health)
      gifs_sample = response["data"].map {|gif| gif["images"]["fixed_height"]["url"]}.sample
      render :json gifs_sample
    end
  end
end