class Search1Controller < ApplicationController
  def index
    @word = search_params[:word]
    @tweets = Tweet.search(@word)
end

private

def search_params
  params.permit(:word)
end
