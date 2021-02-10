class CreateSubComponents < ActiveRecord::Migration[6.1]
  def change
    create_table :sub_components do |t|
      t.string :name
      t.references :component, null: false, foreign_key: true

      t.timestamps
    end
    add_index :sub_components, :name, unique: true
  end
end
