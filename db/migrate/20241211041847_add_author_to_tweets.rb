class AddAuthorToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :author, :text
  end
end
