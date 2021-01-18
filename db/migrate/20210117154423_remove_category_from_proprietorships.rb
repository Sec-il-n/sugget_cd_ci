class RemoveCategoryFromProprietorships < ActiveRecord::Migration[5.2]
  def up
    remove_column :proprietorships, :category
  end
  def down
    add_column :proprietorships, :category, :integer
  end
end
