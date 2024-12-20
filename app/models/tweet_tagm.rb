class TweetTagm < ApplicationRecord
  belongs_to :tweet
  belongs_to :tagm
end
