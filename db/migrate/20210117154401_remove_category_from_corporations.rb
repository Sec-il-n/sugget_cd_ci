class RemoveCategoryFromCorporations < ActiveRecord::Migration[5.2]
  def up
    remove_column :corporations, :category
  end
  def down
    add_column :corporations, :category, :integer
  end
end
