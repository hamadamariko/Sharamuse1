class Tagm < ApplicationRecord
  has_many :tweet_tagms, dependent: :destroy
  has_many :tweets, through: :tweet_tagms

  validates :name, uniqueness: true
end
