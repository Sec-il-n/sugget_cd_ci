class CreateCorporations < ActiveRecord::Migration[5.2]
  def change
    create_table :corporations do |t|
      t.string :name, null: false
      t.string :info, null: false
      t.string :image
      t.integer :category, null: false

      t.timestamps
    end
  end
end
