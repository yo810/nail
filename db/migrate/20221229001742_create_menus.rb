class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.string :name
      t.text :introduction
      t.integer :price
      t.integer :course

      t.timestamps
    end
  end
end
