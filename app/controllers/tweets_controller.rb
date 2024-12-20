class TweetsController < ApplicationController
  before_action :authenticate_user!
  def index
    
    @tweets = params[:tagm_id].present? ? Tagm.find(params[:tagm_id]).tweets : Tweet.all
    if params[:search] == nil
      @tweets= Tweet.all
    elsif params[:search] == ''
      @tweets= Tweet.all
    else
      @tweets = Tweet.where("body LIKE ? ",'%' + params[:search] + '%')
    end
    @tweets = @tweets.page(params[:page]).per(6)
  end
  def new
    @tweet = Tweet.new
  end
  def create
    tweet = Tweet.new(tweet_params)
    if tweet.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end
  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments
    @comment = Comment.new
  end
  def edit
    @tweet = Tweet.find(params[:id])
  end
  def update
    tweet = Tweet.find(params[:id])
    if tweet.update(tweet_params)
      redirect_to :action => "show", :id => tweet.id
    else
      redirect_to :action => "new"
    end
  end
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to action: :index
  end
  private
  def tweet_params
    params.require(:tweet).permit(:body, :youtube_url, :otherurl, tagm_ids: [])
  end
end

def self.looks(search, word)
  if search == "perfect_match"
    @tweet = Tweet.where("body LIKE?", "#{word}")
    @tweet = Tweet.where("author LIKE?", "#{word}")
    @tweet = Tweet.where("instrument LIKE?", "#{word}")
  elsif search == "partial_match"
    @tweet = Tweet.where("body LIKE?","%#{word}%")
    @tweet = Tweet.where("author LIKE?", "#{word}")
    @tweet = Tweet.where("instrument LIKE?", "#{word}")
  else
    @tweet = Tweet.all
  end
end
