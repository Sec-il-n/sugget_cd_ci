class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_image, :string, null: true
    add_column :users, :admin, :boolean, default: false
    # add_reference :users, :corporation, foreign_key: true, null: true
    # add_reference :users, :proprietorship, foreign_key: true, null: true
  end
end
