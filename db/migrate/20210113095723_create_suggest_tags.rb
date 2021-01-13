class CreateSuggestTags < ActiveRecord::Migration[5.2]
  def change
    create_table :suggest_tags do |t|
      t.references :tag, foreign_key: true
      t.references :suggest, foreign_key: true
      t.timestamps
    end
  end
end
