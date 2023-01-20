class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.integer :customer_id
      t.date :day
      t.string :time
      t.datetime :start_time
      t.text :memo
      t.date :cancel
      t.integer :status

      t.timestamps
    end
  end
end
