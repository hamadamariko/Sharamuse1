class AddOtherurlToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :otherurl, :string
  end
end
