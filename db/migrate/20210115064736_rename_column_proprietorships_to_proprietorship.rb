class RenameColumnProprietorshipsToProprietorship < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :users, :proprietorships
    remove_index :users, :proprietorships_id
    remove_column :users, :proprietorships_id, :bigint
    add_reference :users, :proprietorship, foreign_key: true
  end

end
