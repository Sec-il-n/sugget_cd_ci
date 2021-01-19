class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :images
      t.references :suggest, foreign_key: true
      t.timestamps
    end
  end
end
