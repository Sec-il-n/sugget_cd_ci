class AddRfToCorporations < ActiveRecord::Migration[5.2]
  def change
    add_reference :corporations, :category, foreign_key: true
  end
end
