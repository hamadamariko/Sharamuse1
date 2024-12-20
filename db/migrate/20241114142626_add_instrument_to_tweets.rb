class AddInstrumentToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :instrument, :string
  end
end
