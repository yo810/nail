class AddMenuIdToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :menu_id, :integer
  end
end
