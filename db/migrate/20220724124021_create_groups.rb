class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      
      t.integer :owner_id
      t.string :group_name
      t.text :introduction
      t.string :video_type
      t.string :video_title
      t.time :video_time
      t.datetime :start_time

      t.timestamps
    end
  end
end
