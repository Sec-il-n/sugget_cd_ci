class RemoveRfFromUserIdOnSuggests < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :suggests, :users
    remove_index :suggests, :user_id
  end
end
