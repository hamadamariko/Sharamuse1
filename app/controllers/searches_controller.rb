class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:tweet] 
    redirect_to :action => "result"
  end

  def search_result
    @range = params[:tweet]
  end
end
