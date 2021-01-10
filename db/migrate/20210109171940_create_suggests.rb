class CreateSuggests < ActiveRecord::Migration[5.2]
  def change
    create_table :suggests do |t|
      t.string :title, null: false
      t.string :details, null: false
      
      t.timestamps
    end
  end
end
