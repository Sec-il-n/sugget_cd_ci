class ChangeCategoryIdNotNullOnSuggest < ActiveRecord::Migration[5.2]
  def up
    change_column_null :suggests, :category_id, false, 11
    change_column :suggests, :category_id, :bigint, default: 11
  end
  def down
    change_column_null :suggests, :category_id, true, nil
    change_column :suggests, :category_id, :bigint, default: nil
  end
end
