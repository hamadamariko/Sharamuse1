class CreateTweetTagms < ActiveRecord::Migration[6.1]
  def change
    create_table :tweet_tagms do |t|
      t.references :tweet, null: false, foreign_key: true
      t.references :tagm, null: false, foreign_key: true

      t.timestamps
    end
  end
end
