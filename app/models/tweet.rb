class Tweet < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :tweet_tagms, dependent: :destroy
  has_many :tagms, through: :tweet_tagms
end
