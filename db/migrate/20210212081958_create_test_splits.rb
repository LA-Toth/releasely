class CreateTestSplits < ActiveRecord::Migration[6.1]
  def change
    create_table :test_splits do |t|
      t.references :sub_component, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :split_id, null: false

      t.timestamps
    end

    add_index :test_splits, %i[sub_component_id name split_id], unique: true
  end
end
