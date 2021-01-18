class AddRfToProprietorships < ActiveRecord::Migration[5.2]
  def change
    add_reference :proprietorships, :category, foreign_key: true
  end
end
