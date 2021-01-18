class AddRfCategoryToSuggests < ActiveRecord::Migration[5.2]
  def change
    add_reference :suggests, :category, foreign_key: true
  end
end
