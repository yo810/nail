class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :reservation_id
      t.text :content

      t.timestamps
    end
  end
end
