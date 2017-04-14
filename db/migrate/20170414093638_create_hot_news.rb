class CreateHotNews < ActiveRecord::Migration[5.0]
  def change
    create_table :hot_news do |t|
      t.datetime :deadline
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
