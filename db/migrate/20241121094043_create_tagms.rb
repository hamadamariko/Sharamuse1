class CreateTagms < ActiveRecord::Migration[6.1]
  def change
    create_table :tagms do |t|
      t.string :name

      t.timestamps
    end
  end
end
